# ----------------------
# Custom terminal aliases
# ----------------------

## Display current IP address ##
myip() {
  curl http://ipecho.net/plain
  echo
}

## Start new project ##
## Parameter $1 = name of new project directory
newproject() {
  # Make new project directory and initialize to be tracked by git
  mkdir $1 && cd $_
  git init

  # Create local copies of global files to commit to repo
  cp ~/.gitignore_global .gitignore
  cp ~/.editorconfig .editorconfig

  # Insert directory name as first line of README
  echo "# $1" > README.md

  # Open project directory in VS Code
  code .
}

## Create typical docker files for project ##
newdocker() {
  touch Dockerfile Dockerfile.dev .dockerignore

  # Add created files and node modules directory to .dockerignore
  echo 'Dockerfile\nDockerfile.dev\n.dockerignore\nnode_modules/' > .dockerignore
}

## Find apps running on specified port
## Parameter $1 = port #
findport() {
  lsof -n -i4TCP:$1
}

## Kill process
## Parameter $1 = PID
killpid() {
  kill -9 $1
}

## Generate pseudo-random string of characters
generatesecret() {
  node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
}
