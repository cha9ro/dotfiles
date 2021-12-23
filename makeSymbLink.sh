#! /bin/bash

dotfiles=(
    ".vimrc"
    ".zshrc"
    ".p10k.zsh"
    ".zsh"
)

for file in ${dotfiles[@]}
do
    ln -fs ${PWD}/${file} ${HOME}/$file
done