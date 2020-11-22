# ----------------------
# Custom terminal aliases
# ----------------------

## Display current IP address ##
myip() {
  command curl http://ipecho.net/plain
  echo
}

## Start new project ##
newproject() {
  # Make new project directory and initialize to be tracked by git
  command mkdir $1 && cd $_
  command git init

  # Create local copies of global files to commit to repo
  command cp ~/.gitignore_global .gitignore
  command cp ~/.editorconfig .editorconfig

  # Insert directory name as first line of README
  command echo "# $1" > README.md

  # Open project directory in VS Code
  command code .
}

## Create typical docker files for project ##
newdocker() {
  command touch Dockerfile Dockerfile.dev .dockerignore

  # Add created files and node modules directory to .dockerignore
  command echo 'Dockerfile\nDockerfile.dev\n.dockerignore\nnode_modules/' > .dockerignore
}

## Find apps running on specified port
findport() {
  command lsof -n -i4TCP:$1
}

## Kill process by PID
killpid() {
  command kill -9 $1
}
