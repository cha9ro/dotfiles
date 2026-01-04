#! /bin/bash

set -e  # Exit on error

# Function to create symbolic link with backup
create_symlink() {
    local source_file="$1"
    local target_file="$2"
    local display_name="${3:-$(basename "$target_file")}"

    if [ -L "$target_file" ] && [ "$(readlink "$target_file")" = "$source_file" ]; then
        echo "  $display_name already linked correctly"
    elif [ -e "$target_file" ]; then
        mv "$target_file" "$target_file.bak"
        ln -s "$source_file" "$target_file"
        rm "$target_file.bak"
        echo "  $display_name linked"
    else
        ln -s "$source_file" "$target_file"
        echo "  $display_name linked"
    fi
}

echo "==> Setting up macOS environment..."

# install brew: https://brew.sh/
if ! which brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed"
fi

# install formulae by Homebrew
if [ -f Brewfile ]; then
    echo "Installing/updating Homebrew packages..."
    brew bundle
else
    echo "Warning: Brewfile not found, skipping brew bundle"
fi

# install Vundle: https://github.com/VundleVim/Vundle.vim
if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle..."
    mkdir -p ${HOME}/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
else
    echo "Vundle already installed"
fi

# make symbolic links for dotfiles
echo "Creating symbolic links for dotfiles..."
dotfiles=(".vimrc" ".zshrc" ".zfunc" ".p10k.zsh" ".zsh" ".zprofile" ".tool-versions" ".hammerspoon")
for file in ${dotfiles[@]}; do
    create_symlink "${PWD}/${file}" "${HOME}/${file}" "${file}"
done

# make symbolic links for vscode settings
vscode_dir="${HOME}/Library/Application Support/Code/User"
if [ -d "${vscode_dir}" ]; then
    echo "Creating symbolic links for VSCode settings..."
    for file in "settings.json" "keybindings.json"; do
        create_symlink "${PWD}/vscode/${file}" "${vscode_dir}/${file}" "${file}"
    done
else
    echo "VSCode directory not found, skipping VSCode settings"
fi

# make symbolic link for ghostty
ghostty_dir="$HOME/Library/Application Support/com.mitchellh.ghostty"
if [ -d "${ghostty_dir}" ]; then
    echo "Creating symbolic link for Ghostty config..."
    create_symlink "${PWD}/ghostty/config" "${ghostty_dir}/config" "config"
else
    echo "Ghostty directory not found, skipping Ghostty config"
fi

echo "==> Setup complete!"
