# Set $TERM
export TERM=xterm-256color

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Oh my zsh theme
ZSH_THEME="simple"

# Remind on omz updates, but don't auto update
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# Oh my zsh plugins
plugins=(z)

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# Defaults for various terminal settings
if command -v vim > /dev/null
then
	export EDITOR='vim'
fi

# Check that our PATH has what we want in it
if ! [[ "$PATH" =~ "$HOME/.bin:$HOME/.local/bin:$HOME/.cargo/bin" ]]
then
	export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
fi

# Aliases I like with ls. They don't 100% make sense but I like them.
alias ls="ls --color=auto"
alias la="ls -a"   # List all
alias ll="ls -lh"  # List long
alias lr="ls -lhr" # List reversed
alias lt="ls -lht" # List time
unalias l # Disable Fedora default where it's ls -la

# Simple todo manager fom github todotxt/todo.txt-cli
# I sometimes use it more, sometimes less
if command -v todo.sh > /dev/null
then
	alias t="todo.sh"
fi

# I manage my dotfiles with a bare git repo 
# stolen from https://www.atlassian.com/git/tutorials/dotfiles
if command -v git > /dev/null
then
	alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
fi

# Function to mkdir and cd into it all at once 
mkcd () 
{
	mkdir -p -- "$1" && cd -P -- "$1"
}

# Make man display with bat if we have it installed 
if command -v bat > /dev/null
then
	export MANPAGER="sh -c 'col -bx | bat -p -l man'"
	man()
	{
		command man "$@" | eval ${MANPAGER}
	}
fi

# sl is funny and I want to use it
# but you NEED the floating little train!
if command -v sl > /dev/null
then
	alias sl="sl -Fl"
fi

# Set up thefuck, which can correct commands
if command -v thefuck > /dev/null
then
	eval $(thefuck --alias)
fi

# If we're not running tmux or screen and have tmux installed,
# print out whether any sessions are running right now.
if command -v tmux > /dev/null
then
	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux-status
fi
