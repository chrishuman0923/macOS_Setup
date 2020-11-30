#!/bin/sh

PACKAGES=(
  abusaidm.html-snippets
  christian-kohler.npm-intellisense
  christian-kohler.path-intellisense
  codezombiech.gitignore
  dbaeumer.vscode-eslint
  drKnoxy.eslint-disable-snippets
  eamodio.gitlens
  EditorConfig.EditorConfig
  eg2.vscode-npm-script
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  fosshaas.fontsize-shortcuts
  igorming.useful-react-snippets
  mhutchie.git-graph
  mikestead.dotenv
  ms-azuretools.vscode-docker
  naumovs.color-highlight
  redhat.vscode-yaml
  vscode-icons-team.vscode-icons
  zhuangtongfa.material-theme
  Zignd.html-css-class-completion
)

echo "Installing VS Code Extensions...\n"
code --install-extension ${PACKAGES[@]}
