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

# Show current git branch in prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

PS1="\$(parse_git_branch)[\u@\h \W] \$ "

# alias to use todo.sh, because I like it
alias t='todo.sh'

# link to/load z for frecent (frequent and recent) cd functionality
#. ~/.bin/z.sh # I can't make it work right now ughh

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

fortune
