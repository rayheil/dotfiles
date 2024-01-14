# omz.zsh
# oh my zsh config

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Oh my zsh theme
ZSH_THEME="robbyrussell"

# Remind on omz updates, but don't auto update
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13 # check every 13 days

# OMZ plugins
plugins=(z fzf)

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# I don't like the `l` alias much
unalias l

# Do not cd into a directory by name
unsetopt autocd
