# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

# Setup git prompt (code shamelessly stolen from https://salferrarello.com/zsh-git-status-prompt/)
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%b%u%c) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c) '

# Enable colors and setup prompt
autoload -U colors && colors
PROMPT='%1~%b %F{red}${vcs_info_msg_0_}%F{green}❯%f '

# Auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Use vi keys in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Load external config files
source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/aliases.zsh"

# Load plugins
eval "$(zoxide init zsh)"
source "/usr/share/fzf/shell/key-bindings.zsh"
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
