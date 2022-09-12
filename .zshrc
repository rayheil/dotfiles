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
alias la="ls -a"
alias ll="ls -lh"
alias lt="ls -lht"
unalias l # Disable Fedora default where it's ls -la

# Simple todo manager fom github todotxt/todo.txt-cli
if command -v todo.sh > /dev/null
then
	alias t="todo.sh"
fi

# If we have a Todo directory, make some aliases to edit
# predetermined files within it
if [ -d "$HOME/Todo" ]
then
	alias todo="$EDITOR ~/Todo/manual.txt"
	alias timecard="$EDITOR ~/Todo/timecard.txt"
fi

# I use this to manage my dotfiles in a bare directory
if command -v git > /dev/null
then
	alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
fi

# Function to mkdir and cd into it all at once 
mkcd ()
{
	mkdir -p -- "$1" &&
           cd -P -- "$1"
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
if command -v sl > /dev/null
then
	alias sl="sl -Fl"
fi


# It here, I like it.
if command -v neofetch > /dev/null
then
	neofetch
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
