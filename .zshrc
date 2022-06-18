# haukkagu's zsh config

# Load external sources
[ -f "$HOME/.config/shell/exportrc" ] && source "$HOME/.config/shell/exportrc"
[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"

# Enable colors and change prompt
autoload -U colors && colors
PS1="%B[%~] %F{green}::%f%b "

# Auto/tab completion
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit

# Vi mode
bindkey -v
export KEYTIMEOUT=1

## Use vi keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char
bindkey -v '^w' backward-delete-word

## Change cursor shape for different vi modes
function zle-keymap-select () {
	case $KEYMAP in
		vicmd) echo -ne '\e[1 q';;	# block
		viins|main) echo -ne '\e[5 q';;	# beam
	esac
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins
	echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# Load syntax highlighting
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
