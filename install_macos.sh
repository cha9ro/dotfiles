#! /bin/bash

# install brew: https://brew.sh/
if which brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# install formulae by Homebrew
brew bundle

# install sdkman: https://sdkman.io/install
if [ ! -d ${HOME}/.sdkman ]; then
    curl -s "https://get.sdkman.io" | bash
    source ${HOME}/.sdkman/bin/sdkman-init.sh
fi

# initialize anyenv: https://github.com/anyenv/anyenv
# add update plugin: https://github.com/znz/anyenv-update
if [ ! -d ${HOME}/.config/anyenv/anyenv-install ]; then
    anyenv install --init
    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi

# install Vundle: https://github.com/VundleVim/Vundle.vim
if [ ! -d ${HOME}/.vim/bundle ]; then
    mkdir -p ${HOME}/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
fi

# make symbolic links
dotfiles=(
    ".vimrc"
    ".zshrc"
    ".zfunc"
    ".p10k.zsh"
    ".zsh"
)
for file in ${dotfiles[@]}
do
    ln -fs ${PWD}/${file} ${HOME}/$file
done
