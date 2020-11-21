#!/bin/sh

# Install extensions
./config/vscode/extensions.sh

# Replace VS Code settings.json
REPO_FILE="./config/vscode/settings.json"
LOCAL_FILE="$HOME/Library/Application\ Support/Code/User/settings.json"

echo "Updating VS Code settings.json...\n"
cp "$REPO_FILE" "$LOCAL_FILE"

echo "Done."
