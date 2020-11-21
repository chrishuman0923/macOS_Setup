#!/bin/sh

PACKAGES=(
  git
  mas
)

echo "Installing Brew Packages..."
brew install ${PACKAGES[@]}
