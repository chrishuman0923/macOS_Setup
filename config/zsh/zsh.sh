#!/bin/sh

# Set variable with base directory path for easy re-use
if [ ! -d "$HOME/.oh-my-zsh" ]
then
  echo "Installing Oh-My-Zsh...\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh-My-Zsh already installed...\n"
fi

REPO_FILE="./config/zsh/.zshrc"
LOCAL_FILE="$HOME/.zshrc"
if [ ! -f $LOCAL_FILE ]
then
  echo "Setting Zsh profile...\n"
  cp "$REPO_FILE" "$LOCAL_FILE"
else
  echo "Zsh profile file already exists.\n"
fi

REPO_FILE="./config/zsh/alias.zsh"
LOCAL_FILE="$HOME/.oh-my-zsh/custom/alias.zsh"
if [ ! -f $LOCAL_FILE ]
then
  echo "Creating Zsh aliases file...\n"
  cp "$REPO_FILE" "$LOCAL_FILE"
else
  # Get user input
  read -p "Zsh custom alias file already exists. Do you wish to overwrite it [y/n]? " OVERWRITE

  case $OVERWRITE in
    [yY]|[yY][eE][sS])
      echo "Overwriting zsh alias file...\n"
      cat "$REPO_FILE" > "$LOCAL_FILE"
      ;;
    *)
      echo "Skipped...\n"
      ;;
  esac
fi

DIR="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
if [ ! -d "$DIR" ]
then
  echo "Installing Zsh plugin source code...\n"
  git clone https://github.com/zsh-users/zsh-autosuggestions $DIR
  echo ""
fi

echo "Done."
