# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load custom functions
fpath+=${HOME}/.zfunc

# zsh completion
source ${HOME}/.zsh/zsh-completions/zsh-completions.plugin.zsh
if type brew &>/dev/null; then 
  fpath+=$(brew --prefix)/share/zsh/site-functions 
fi
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache on
export PATH=".:$PATH"

# candidate colorization
autoload -Uz colors && colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=2000
export SAVEHIST=100000
setopt hist_ignore_dups
# fzf-history
autoload -Uz fzf-history
zle -N fzf-history
bindkey '^R' fzf-history

# plugins
source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOME}/.zsh/emoji-cli/emoji-cli.zsh

# volta
export PATH="${HOME}/.volta/bin:${PATH}"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"

# theme
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# tfenv and terraform
if type terraform&>/dev/null; then
  complete -o nospace -C $(which terraform) terraform
fi

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# direnv hook
if type direnv&>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# cloud storage home
export CLOUD_STORAGE_HOME="${HOME}/Library/CloudStorage"

# Disable AWS SAM CLI telementry collection
export SAM_CLI_TELEMETRY=0

# alias
alias activate="source .venv/bin/activate"
alias ll="ls -l"
alias lla="ls -la"
alias ls="ls -G"
alias k="kubectl"
alias tf="terraform"
alias n="nvim"

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

# Added by Windsurf
export PATH="/Users/takuro/.codeium/windsurf/bin:$PATH"

. "$HOME/.local/bin/env"

# pnpm
export PNPM_HOME="/Users/takuro/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
