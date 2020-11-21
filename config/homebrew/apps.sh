#!/bin/sh

PACKAGES=(
  1password
  alfred
  docker
  google-chrome
  mongodb-compass
  mysqlworkbench
  postman
  visual-studio-code
  vlc
)

echo "Installing Cask Packages..."
brew cask install ${PACKAGES[@]}
