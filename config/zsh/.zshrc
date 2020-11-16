# ----------------------
# Env Variables
# ----------------------

export ZSH="${HOME}/.oh-my-zsh"

# ----------------------
# Theme and General Config
# ----------------------

ZSH_THEME="robbyrussell"

## Automatically update without prompting ##
DISABLE_UPDATE_PROMPT="true"

## Display red dots while waiting for task completion ##
COMPLETION_WAITING_DOTS="true"

# ----------------------
# Plugins
# ----------------------

plugins=(git wd zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ----------------------
# NVM Config
# ----------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Use latest downloaded stable verison of Node.js ##
nvm use stable
