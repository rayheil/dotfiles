#
# Oh My Zsh Installation
#

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Pretend that we're xterm because ssh seems to dislike foot
export TERM="xterm"

# Oh my zsh theme
ZSH_THEME="simple"

# Remind on omz updates, but don't auto update
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# Oh my zsh plugins
plugins=(git web-search z python)

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# Defaults for various terminal settings
export EDITOR='vim'
export PATH="/home/ray/.local/bin:/home/ray/.bin:$PATH"
export RANGER_LOAD_DEFAULT_RC="FALSE" # Load my ranger rc, not the default

# ls aliases because I'm lazy
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -lh"
alias l="ll"
alias lt="ls -lht"
alias sl="sl -Fl" # hehe sl

# todo.sh from https://github.com/todotxt/todo.txt-cli
alias t="todo.sh"

# I use this to manage my dotfiles in a bare directory
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Neofetch with pretty colors!
if (( $(tput cols) > 78 )); then
	neofetch
fi

# Syntax highlighting for more pretty colors
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
