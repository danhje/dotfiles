# Ensure the Fira Code Nerd Font is installed.
if [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS
    mkdir -p ~/Library/Fonts/
    for type in Bold Light Medium Regular Retina; do wget -nc -O ~/Library/Fonts//FiraCode-$type.ttf "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/$type/complete/Fira%20Code%20$type%20Nerd%20Font%20Complete.ttf?raw=true"; done
else
    mkdir -p ~/.local/share/fonts/
    for type in Bold Light Medium Regular Retina; do wget -nc -O ~/.local/share/fonts//FiraCode-$type.ttf "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/$type/complete/Fira%20Code%20$type%20Nerd%20Font%20Complete.ttf?raw=true"; done
    fc-cache -f
fi
cd -

# Ensure Starship is installed and up to date.
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --force

# Ensure dotfiles are downloaded.
mkdir -p ~/.dotfiles
wget -O ~/.dotfiles/starship.toml "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/starship.toml"
wget -O ~/.dotfiles/.commonrc "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/.commonrc"
wget -O ~/.dotfiles/.zshrc "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/.zshrc"
wget -O ~/.dotfiles/.bashrc "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/.bashrc"

# Ensure dotfiles are symlinked.
rm -f ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
rm -f ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc

# Source dotfiles.
shell_name=$(sh -c 'ps -p $$ -o ppid=' | xargs ps -o comm= -p)
if [[ $shell_name == "-zsh" ]]; then
    source ~/.zshrc
elif [[ $shell_name == "-bash" ]]; then
    source ~/.bashrc
fi

# Finished
echo "Done. Remember to move or symlink any local rc to ~/.localrc"
