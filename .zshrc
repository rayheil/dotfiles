# Source files from zshrc dir
for file in $HOME/.zshrc.d/*.zsh; do
	source "$file"
done
# Include cross-shell aliases
source $HOME/.aliases

