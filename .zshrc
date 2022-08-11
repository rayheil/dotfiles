#
# Oh My Zsh Installation
#

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

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
#export MANPAGER="sh -c 'col -bx | bat -l man -p'" # bat as manpager (pretty!)
export EDITOR='vim'
export PATH="/home/ray/.local/bin:/home/ray/.bin:$PATH"
export RANGER_LOAD_DEFAULT_RC="FALSE" # Load my ranger rc, not the default

# ls aliases because I'm lazy
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -lh"
alias l="ll"
alias lt="ls -lht"

# I use this to manage my dotfiles in a bare directory
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Syntax highlighting for more pretty colors
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
