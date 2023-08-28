# Every time a MathLAN user starts a bash shell, it runs a .bashrc script
# like this one.

# John David Stone, Bazil Mupisiri, Alex French, Reilly Grant, Logan Goldberg
# Department of Computer Science
# Grinnell College
# stone@cs.grinnell.edu, mupisiri@grinnell.edu, frenchal17@grinnell.edu,
#  grantrei@grinnell.edu, goldberg@grinnell.edu

# created August 23, 1999
# last revised by Mike Conner Sept. 22, 2017

# Exit immediately if the shell is not interactive.

[ -z "$PS1" ] && return

# Set the prompt to machine name, dollar sign, space.

PS1="\u@\h:\W\$ "

# Notify the user as soon as a background job is completed.

set -o notify

# Avoid accidental overwriting of files.

set -o noclobber

# Define some system-independent commands.

alias print="/usr/bin/a2ps -=lp --sides=duplex"

# Have `checkuser' look up the MathLAN account information for a user.

alias checkuser="/usr/bin/ypcat passwd | /bin/grep"

# Have `password' change the user's network-wide password.

alias password="/net/bin/passphrase"

# Have `share' make files accessible and `unshare' make them inaccessible.

alias share="/bin/chmod go+rX"
alias unshare="/bin/chmod go-rwx"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    
    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# Sources the custom aliases file with gpg encryption commands.

if [ -f ~/.bash_encryption-commands ]; then
    . ~/.bash_encryption-commands
fi

# Ensure that spawned shells know the values of critical environment
# variables.

export PS1 PS2


##########################################################################
###### --- CSC-151 Students: put your customizations below this --- ######
##########################################################################



##########################################################################
###### --- CSC-161 Students: put your customizations below this --- ######
##########################################################################

# Make MyroC libraries known to the execution environment
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/walker/MyroC/lib"

export LD_LIBRARY_PATH

##########################################################################
###### --- CSC-207 Students: put your customizations below this --- ######
##########################################################################



##########################################################################
#### --- CSC-321-322 Students: put your customizations below this --- ####
##########################################################################



######################################################################
######### --- Place all other customizations below this --- ##########
######################################################################

# Include cross-shell aliases
for file in $HOME/.alias.d/*.sh; do
	source "$file"
done

export EDITOR=nvim

# Display tmux info if it is installed and we're not in screen or tmux
if command -v tmux > /dev/null
then
	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux-status
fi
