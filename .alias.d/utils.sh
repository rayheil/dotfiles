# utils.sh
# file and config utility aliases

# Utils
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# a two-letter alias for jobs, like bg and fg
alias jb="jobs"

# using todo.txt-cli (https://github.com/todotxt/todo.txt-cli), I like a 1-letter alias
alias t="todo.sh"

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

# swap two files, renaming one to the other
swap() {
	tmp=`mktemp`
	mv $1 $tmp
	mv $2 $1
	mv $tmp $2
}

# repeat a command N times
function repeat() {
	number = $1
	shift
	for n in $(seq $number); do
		$@
	done
}

# I can't break this bad habit
alias vim="nvim"

alias open="xdg-open"
