# haukkagu's bash config

# Load external sources
[ -f "$HOME/.config/shell/exportrc" ] && source "$HOME/.config/shell/exportrc"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
