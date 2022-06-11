# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.bin:$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.bin:$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lt='ls -lht'

# config aliases
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Show current git branch in prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

PS1="\$(parse_git_branch)[\u@\h \W] \$ "

# link to/load z for frecent (frequent and recent) cd functionality
#. ~/:.bin/z.sh # I can't make it work right now ughh

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

