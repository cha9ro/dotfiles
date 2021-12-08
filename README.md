# Env management
Env management and installation for new machines.

## dotfiles
Make symbolic link
```bash
# example of .zshrc
$ cd ${PATH_TO_THIS_REPOSITORY}
$ ln -fs ${PWD}/.zshrc ${HOME}/.zshrc
```

## Homebrew
Dump packges managed by Homebrew
```bash
$ brew bundle dump
```

Install packages from `Brewfile`
```bash
$ brew bundle
```

## Zsh theme
[powerlevel10k](https://github.com/romkatv/powerlevel10k)

```zsh
# configure 
> p10k configure
```

## Other packages to manually install
- sdkman
- anyenv
- mysql
- docker

