#!/bin/sh

echo "Configuring npm user...\n"

# Get user details
read -p "Enter your name: " NAME
read -p "Enter your email: " EMAIL

npm config set init.author.name "$NAME"
npm config set init.author.email "$EMAIL"

echo "\nSettings additional defaults...\n"

npm config set init.license "MIT"
npm config set init.version "1.0.0"
npm config set loglevel "error"

echo "Done."
