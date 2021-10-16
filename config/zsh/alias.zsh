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
  cp ~/.editorconfig .editorconfig

  # Insert directory name as first line of README
  echo "# $1" > README.md

  # Add nvmrc file to project
  node -v > .nvmrc

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

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  fi
}
