# Env management
Env management and installation for new machines.

## dotfiles
Make symbolic links of dotfiles to home

```bash
$ cd <PATH_TO_THIS_DIRECTORY>
$ chmod 744 makeSymbLink.sh
$ bash -c "./makeSymbLink.sh"
```

## Homebrew
Dump packages managed by Homebrew

```bash
$ brew bundle dump
```

Install packages from `Brewfile`

```bash
$ brew bundle
```

## Zsh theme
[powerlevel10k](https://github.com/romkatv/powerlevel10k)

## Other packages to manually install
- sdkman
- anyenv
- mysql
- docker

