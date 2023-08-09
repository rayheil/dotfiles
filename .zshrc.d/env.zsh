# env.zsh
# environment config

# Set $TERM
export TERM=xterm-256color

# Make sure gpg works...? I didn't need this in the past
export GPG_TTY=$(tty)

# Defaults for various terminal settings
export EDITOR=nvim

# Link .ghcup environment if installed
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# Set PATH to include important stuff
DESIRED_PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/script:$HOME/.ghcup/bin"
if ! [[ "$PATH" =~ $DESIRED_PATH ]]; then
	export PATH="$PATH:$DESIRED_PATH"
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
