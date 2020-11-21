#!/bin/sh

# Check if Homebrew is installed
DIR="/usr/local/Homebrew"
if [ ! -d $DIR ]
then
  echo "Installing Homebrew...\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew update
else
  echo "Homebrew already installed...\n"
fi

# Running tools.sh to install Homebrew tools
./config/homebrew/tools.sh

# Running apps.sh to install Homebrew cask apps
./config/homebrew/apps.sh

echo "Done."
