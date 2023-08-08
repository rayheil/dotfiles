# Source files from zshrc dir
for file in $HOME/.zshrc.d/*.zsh; do
	source "$file"
done

# Source files from aliases dir
for file in $HOME/.alias.d/*.sh; do
	source "$file"
done
