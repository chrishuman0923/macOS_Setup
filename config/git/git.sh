#!/bin/sh

echo "Configuring git globals...\n"

# Get user details
read -p "Enter your name: " NAME
read -p "Enter your email: " EMAIL

git config --global user.name "$NAME"
git config --global user.email $EMAIL
git config --global init.defaultBranch master

# Set git rebase default behavior
echo "Setting pull.rebase to false.."
git config --global pull.rebase false

# Set Git core editor
read -p "Do you want to set VS Code as your git core editor [y/n]? " CORE
case $CORE in
  [yY]|[yY][eE][sS])
    echo "Git core editor set.\n"
    git config --global core.editor "code -w"
    ;;
  *)
    echo "Skipping...\n"
    ;;
esac

# Set Git diff editor
read -p "Do you want to set VS Code as your git diff editor [y/n]? " DIFF
case $DIFF in
  [yY]|[yY][eE][sS])
    echo "Git diff editor set.\n"
    git config --global diff.tool vscode
    git config --global difftool.vscode.cmd "code -w --diff $LOCAL $REMOTE"
    ;;
  *)
    echo "Skipping...\n"
    ;;
esac

# Set Git merge editor
read -p "Do you want to set VS Code as your git merge editor [y/n]? " MERGE
case $MERGE in
  [yY]|[yY][eE][sS])
    echo "Git merge editor set.\n"
    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd "code -w $MERGED"
    ;;
  *)
    echo "Skipping...\n"
    ;;
esac

echo "Done."

