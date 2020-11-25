#!/bin/sh

# Install extensions
./config/vscode/extensions.sh

# Replace VS Code settings.json
REPO_FILE="./config/vscode/settings.json"
LOCAL_DIR="$HOME/Library/Application Support/Code/User"

echo "Updating VS Code settings.json...\n"
cp "$REPO_FILE" "$LOCAL_DIR"

# Add global snippets file
REPO_FILE="./config/vscode/global.code-snippets"
LOCAL_DIR="$HOME/Library/Application\ Support/Code/User/snippets"

echo "Adding VS Code snippets...\n"

# Create directory if necessary
if [ ! -d LOCAL_DIR ]
then mkdir -p "$LOCAL_DIR"
fi

cp "$REPO_FILE" "$LOCAL_DIR"

echo "Done."
