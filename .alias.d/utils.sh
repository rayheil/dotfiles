# utils.sh
# file and config utility aliases

# Utils
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# update whatever you might want to
alias update="paru -Syu && flatpak update"

# cd and list
cdl () {
	cd "$1" && ls
}

# cd into new dir
mkcd () {
	mkdir -p -- "$1" && cd -P -- "$1" 
}

# print full path to file
pwf () {
	echo $(pwd)/$1
}

# auto attach or create tmux session
tm() {
	tmux attach -t $1 || tmux new -s $1
}
