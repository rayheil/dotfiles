# Set $TERM
export TERM=xterm-256color

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Make sure gpg works...? I didn't need this in the past
export GPG_TTY=$(tty)

# Oh my zsh theme
ZSH_THEME="sunrise" # set by `omz`

# Remind on omz updates, but don't auto update
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# Oh my zsh plugins
plugins=(z)

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# Include cross-shell aliases
source $HOME/.aliases

# oh-my-zsh likes to set an alias I don't enjoy
unalias l

# Defaults for various terminal settings
export EDITOR=nvim

# Check that our PATH has what we want in it
if ! [[ "$PATH" =~ "$HOME/.bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/script:$HOME/.config/emacs/bin" ]]
then
	export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH:$HOME/.local/script:$HOME/.config/emacs/bin"
fi

# Make man display with bat if we have it installed 
if command -v bat > /dev/null
then
	export MANPAGER="sh -c 'col -bx | bat -p -l man'"
	man()
	{
		command man "$@" | eval ${MANPAGER}
	}
fi

# Set up thefuck, which can correct commands
if command -v thefuck > /dev/null
then
	eval $(thefuck --alias)
fi

# Print out a silly error from fortune
if command -v fortune > /dev/null
then
	fortune bofh-excuses
	echo ""
fi

# If we're not running tmux or screen and have tmux installed,
# print out whether any sessions are running right now.
if command -v tmux > /dev/null
then
	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux-status
fi

# Link .ghcup environment
[ -f "/home/ray/.ghcup/env" ] && source "/home/ray/.ghcup/env"

# Do not cd into a directory by name in oh-my-zsh
unsetopt autocd

[ -f "/home/ray/.ghcup/env" ] && source "/home/ray/.ghcup/env" # ghcup-env