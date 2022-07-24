# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.bin:$HOME/.local/bin:" ]]; then
    PATH="$HOME/.bin:$HOME/.local/bin:$PATH"
fi
export PATH

# Preferred editor for local and remove sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vi'
else
    export EDITOR='vim'
    export GPG_TTY=$(tty)
fi

# Make sure ranger loads the config in ~/.config/ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# Simple ls aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias lt='ls -lht'
alias ll='ls -lh'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias td='todo' # Follow tda, tde, tdd pattern to call devtodo

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
