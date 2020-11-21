#!/bin/sh

LOCAL_FILE="$HOME/.ssh/id_rsa_github"

if [ ! -f "$LOCAL_FILE" ]
then
  # Create new ssh key
  read -p "Enter email address: " EMAIL
  ssh-keygen -t rsa -b 4096 -C $EMAIL -f "$LOCAL_FILE"
fi

# Confirm ssh-agent is running
echo ""
eval "$(ssh-agent -s)"
echo ""

echo "Adding ssk key to ssh-agent...\n"
ssh-add -K "$LOCAL_FILE"

# Add ssh-agent config to load key after each device restart
REPO_FILE="./config/ssh/config"
LOCAL_FILE="$HOME/.ssh/config"

if [ ! -f "$LOCAL_FILE" ]
then
  echo "\nCreating ssh config...\n"
  cat "$REPO_FILE" > "$HOME/.ssh/config"
else
  echo "\nAppending to existing ssh config...\n"
  cat "$REPO_FILE" >> "$HOME/.ssh/config"
fi

echo "Done."
