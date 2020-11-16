# macOS Setup

Getting a new device; it is a day that developers look forward to and loath in equal measure. Why you ask?

Don't misunderstand, we love getting a new device. It gives us a clean slate to start fresh and, usually, a new device means a hardware upgrade in one respect or another.

But, this new device brings with it a problem. For most of us, we are going to spend the better part of a day setting it up. From downloading countless applications, to updating countless config files; it is a chore to set up a new device to make it conducive to development. The biggest worry is that we are going to forget something crucial to the zen of our workflow.

With that in mind, I was convinced there had to be a better way. Luckily, I am not the first developer who wished they could automate their on-boarding process. This repository documents my process for on-boarding a new macOS device for web application development.

## Pre-Requisites

1.  Sign in to iCloud account
1.  Download Xcode command line tools

    - Needed by many npm packages

          xcode-select --install

1.  Download Oh-My-Zsh

    - Terminal framework for adding plugins and themes to improve existing Zsh shell

          sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

1.  Copy Zsh Profile, Aliases, and Plugins

    - Configuration profile for Zsh shell

          curl https://raw.githubusercontent.com/chrishuman0923/macOS_Setup/master/config/zsh/.zshrc > ~/.zshrc

    - Configure Zsh shell command aliases

          curl https://raw.githubusercontent.com/chrishuman0923/macOS_Setup/master/config/zsh/alias.zsh > $ZSH_CUSTOM/alias.zsh

    - Clone source code for auto-suggestion plugin

          git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestion

## Git Configuration

- Configure Git globals

  - Set User Details

        git config --global user.name “Chris Human”
        git config --global user.email “email@email.com”

  - Set Global ignore file

        curl https://raw.githubusercontent.com/chrishuman0923/macOS_Setup/master/config/git/.gitignore_global > ~/.gitignore_global

        git config --global core.excludesfile ~/.gitignore_global

  - Set Git Pull Behavior

        git config --global pull.rebase false

  - Set `VS Code` as Git core editor

        git config --global core.editor “code -w”

  - Set `VS Code` as Git diff editor

        git config --global diff.tool vscode
        git config --global difftool.vscode.cmd "code -w --diff $LOCAL $REMOTE"

  - Set `VS Code` as Git merge editor

        git config --global merge.tool vscode
        git config --global mergetool.vscode.cmd "code -w $MERGED"

## SSH Key Configuration

I configure Github with an ssh key to avoid the need to enter my Github credentials each time I interact with a remote and to prevent adding my Github credentials to iCloud Keychain.

- Generate ssh key for Github

      ssh-keygen -t rsa -b 4096 -C email@email.com -f ~/.ssh/id_rsa_github

- Confirm `ssh-agent` is running

      eval "$(ssh-agent -s)"

- Add private key to `ssh-agent`

      ssh-add ~/.ssh/id_rsa_github

- Copy public key to clipboard and add it to Github [here](https://github.com/settings/keys)

      cat ~/.ssh/id_rsa_github.pub | pbcopy

- Confirm ssh authentication is set up correctly

      ssh -T git@github.com

## Notes

Unfortunatley, this process does not include signing in to all of the accounts for the applications installed. Maybe in a future update. 🤞🏻 😁

## Acknowledgments

I have to give credit to [w3cj](https://github.com/w3cj) and [nikhilgorantla](https://github.com/nikhilgorantla) for the inspiration and several of the code snippets used within this repo.
