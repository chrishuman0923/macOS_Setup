#!/bin/sh

# Install extensions
./config/vscode/extensions.sh

# Replace VS Code settings.json
REPO_FILE="./config/vscode/settings.json"
LOCAL_DIR="$HOME/Library/Application Support/Code/User"

echo "Updating VS Code settings.json...\n"
cp "$REPO_FILE" "$LOCAL_DIR"

echo "Done."
