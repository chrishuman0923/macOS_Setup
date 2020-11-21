#!/bin/sh

# Install macOS apps
# 441258766   --> Magnet
# 1116599239  --> Nord VPN

PACKAGES=(
  441258766
  1116599239
)

echo "Installing Apple App Store Apps..."
mas install ${PACKAGES[@]}
