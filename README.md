# dotfiles

Env management and installation for new machines by cha9ro.

## Installation

Make symbolic links of dotfiles to home

```bash
git clone https://github.com/cha9ro/dotfiles.git
cd dotfiles
chmod 744 install_macos.sh
bash -c "./install_macos.sh"
```

## Zsh theme

Manually install [fonts](https://github.com/romkatv/powerlevel10k#manual-font-installation) used in [powerlevel10k](https://github.com/romkatv/powerlevel10k)

## Vim plugins

Install vim plugins via [Vundle](https://github.com/VundleVim/Vundle.vim):

```
:PluginInstall
```

## NeoVim

Install neovim with LazyVim

## Other packages to manually install

Install the following packages if necessary

- mysql
- docker
