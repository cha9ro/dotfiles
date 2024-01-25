#! /bin/bash

VSCODE_USER_DIR="${HOME}/Library/Application Support/Code/User"

ln -s ${HOME}/dotfiles/vscode/settings.json ${VSCODE_USER_DIR}/settings.json
ln -s ${HOME}/dotfiles/vscode/keybindings.json ${VSCODE_USER_DIR}/keybindings.json
