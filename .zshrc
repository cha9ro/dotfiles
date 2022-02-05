# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh completion
source ${HOME}/.zsh/zsh-completions/zsh-completions.plugin.zsh
source ${HOME}/.zsh/zsh-other-completions/zsh-other-completions.plugin.zsh
autoload -U compinit; compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache on
export PATH=".:$PATH"

# candidate colorization
autoload -U colors; colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=2000
export SAVEHIST=100000
setopt hist_ignore_dups

# plugins
source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOME}/.zsh/emoji-cli/emoji-cli.zsh
# completions
source <(kubectl completion zsh)
source <(stern --completion=zsh)

# theme
source ~/.zsh/zsh-themes/powerlevel10k/powerlevel10k.zsh-theme
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# mysql
export PATH="/usr/local/mysql/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# less syntax highlight
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
alias less='less -R'

# direnv hook
eval "$(direnv hook zsh)"

# alias
alias activate="source .venv/bin/activate"
alias ll="ls -l"
alias ls="ls -G"
alias k="kubectl"

## git alias
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gce='gitmoji -c'
alias gco='git checkout'
alias gcoa='git branch | fzf | xargs git checkout'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph --color | emojify | less -r'
alias glogcat='git log --oneline --decorate --graph --color | emojify'
alias gloga='git log --oneline --decorate --graph --color --all | emojify | less -r'
alias gm='git merge'
alias gp='git push'
alias gst='git status'
alias gf='git fetch'



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
