# macOS Setup

## Overview

Getting a new device; it is a day that developers look forward to and dread in equal measure. Why you ask?

Don't misunderstand, we love getting a new device. It gives us a clean slate to start fresh and, usually, a new device means a hardware upgrade to some degree.

But, this new device brings with it a problem. For most of us, we will spend the better part of a day setting it up. From downloading countless applications, to updating countless config files; it is a chore to set up a new device to make it conducive for development.

I was convinced there had to be a better way. Luckily, I am not the first developer who wished they could simplify their on-boarding process.

### TLDR

This repository walks you through the steps (_including terminal commands and config files_) I use when on-boarding a new macOS device for web application development.

## Pre-Requisites

1. Clone this repo

   ```
   git clone https://github.com/chrishuman0923/macOS_Setup.git
   cd macOS_Setup/
   ```

1. Sign in to iCloud account
1. Sign in to App Store
1. Download Xcode command line tools

   - Needed by many npm packages

     ```
     xcode-select --install
     ```

1. Set user execution permissions to run config scripts in this repo

   ```
   chmod -R u+x config
   ```

1. Run script to handle general configuration details

   ```
   ./config/general.sh
   ```

## Zsh Configuration

- Run script to configure Zsh

  ```
  ./config/zsh/zsh.sh
  ```

## Git Configuration

- Run script to configure git globals

  ```
  ./config/git/git.sh
  ```

## SSH Key Configuration

I configure Github with an ssh key to avoid entering my Github credentials each time I interact with a remote and to avoid adding my Github credentials to iCloud Keychain.

- Run script to generate ssh key for Github and add it to ssh-agent

  ```
  ./config/ssh/ssh.sh
  ```

- Copy public key to clipboard and add it to Github [here](https://github.com/settings/keys)

  ```
  cat ~/.ssh/id_rsa_github.pub | pbcopy
  ```

- Restart device

- Confirm ssh authentication is set up correctly and key is being loaded after restart

  ```
  ssh -T git@github.com
  ```

## Homebrew

I use Homebrew to install and manage the majority of my applications.

- Run script to install Homebrew

  ```
  ./config/homebrew/homebrew.sh
  ```

- Alfred is my quick launcher of choice. Re-map `CMD + space` from Spotlight to Alfred.

## App Store Apps

There are a few apps that I have to get directly from the app store.

- Run script to install app store apps

  - _**NOTE**_: Please review this script before executing because some of the apps are not free.

    ```
    ./config/mac/apps.sh
    ```

## NVM (Node Version Manager)

I use nvm to easily manage and switch between versions of Node.js

- Install nvm and latest stable version of Node.js

  ```
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
  nvm install stable
  ```

- Run script to configure npm

  ```
  ./config/npm/npm.sh
  ```

## VS Code

- Run script to install VS Code extensions

  ```
  ./config/vscode/vscode.sh
  ```

  - If the above command fails
    1. Open VS Code
    1. Use `CMD + Shift + P` to open the command palette
    1. Type `install`
    1. Choose `Shell Command: Install 'code' command in PATH`
    1. Restart terminal and re-run the command

## Browser Extensions

I am using the following browser extenions for Google Chrome.

1. 1Password X - Password Manager
1. HTTPS Everywhere
1. JSON Formatter
1. OneTab
1. Privacy Badger
1. React Developer Tools
1. Redux DevTools
1. Tabliss
1. uBlock Origin

## Notes

Unfortunatley, this setup does not include "auto-magically" signing in to all of the accounts for the applications installed. Maybe in a future update. 🤞🏻 😁

## Acknowledgments

I have to give credit to [w3cj](https://github.com/w3cj) and [nikhilgorantla](https://github.com/nikhilgorantla) for the inspiration and several of the code snippets/methods used within this repo.
