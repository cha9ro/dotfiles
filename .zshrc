# zsh customization
autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

autoload -Uz colors && colors

autoload -Uz vcs_info
precmd_vcs_info() {vcs_info}
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# zprompt
RPROMPT=\$vcs_info_msg_0_
PROMPT='%F{green}%~%f> '

# plugins
source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOME}/.zsh/emoji-cli/emoji-cli.zsh

# mysql
export PATH="/usr/local/mysql/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# alias
alias activate="source .venv/bin/activate"
alias ll="ls -l"

## git alias
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
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
export SDKMAN_DIR="/Users/takuro/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

