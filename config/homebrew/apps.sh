#!/bin/sh

PACKAGES=(
  1password
  alfred
  cyberduck
  docker
  figma
  google-chrome
  insomnia
  krisp
  mongodb-compass
  mysqlworkbench
  pgadmin4
  slack
  visual-studio-code
  vlc
  zoom
)

echo "Installing Cask Packages..."
brew install ${PACKAGES[@]} --cask
