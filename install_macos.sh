#! /bin/bash

# install brew: https://brew.sh/
if which brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# install formulae by Homebrew
brew bundle

# install Vundle: https://github.com/VundleVim/Vundle.vim
if [ ! -d ${HOME}/.vim/bundle ]; then
    mkdir -p ${HOME}/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi

# make symbolic links for dotfiles
dotfiles=(
    ".vimrc"
    ".zshrc"
    ".zfunc"
    ".p10k.zsh"
    ".zsh"
    ".zprofile"
    ".tool-versions"
    ".hammerspoon"
)
for file in ${dotfiles[@]}
do
    ln -fs ${PWD}/${file} ${HOME}/$file
done

# make symbolic links for vscode settings
vscode_settings=(
    "vscode/settings.json"
    "vscode/keybindings.json"
)
for file in ${vscode_settings[@]}
do
    ln -fs ${PWD}/${file} ${HOME}/Library/Application\ Support/Code/User/$file
done

# make symbolic link for ghostty
ln -fs ${PWD}/ghostty/config "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

