#!/bin/sh

DIR="$HOME/Library/Fonts/"

echo "Adding Anonymous Pro font to $DIR...\n"
unzip -oq ./config/AnonymousPro-1.002.zip
cp -f AnonymousPro-1.002.001/* $DIR
rm -rf AnonymousPro-1.002.001 ._AnonymousPro-1.002.001

# Copy .editorconfig file to $HOME
echo "Adding global .editorconfig file to $HOME/\n"
cp ./.editorconfig $HOME/

# Create directory to contain all coding projects
DIR="$HOME/Projects"

if [ ! -d "$DIR" ]
then
  echo "Creating directory $DIR to contain all coding projects...\n"
  mkdir ~/Projects
fi

echo "Done."
