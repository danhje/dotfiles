#!/bin/sh

# Get shell name
shell_name=$(sh -c 'ps -p $$ -o ppid=' | xargs ps -o comm= -p)

# Ensure the Fira Code Nerd Font is installed.
case $OSTYPE in
    "darwin"* )
        # MacOS
        mkdir -p ~/Library/Fonts/
        for type in Bold Light Medium Regular Retina; do wget -nc -O ~/Library/Fonts/FiraCode-$type.ttf "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/$type/FiraCodeNerdFont-$type.ttf"; done
        ;;
    * )
        mkdir -p ~/.local/share/fonts/
        for type in Bold Light Medium Regular Retina; do wget -nc -O ~/.local/share/fonts/FiraCode-$type.ttf "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/$type/FiraCodeNerdFont-$type.ttf"; done
        fc-cache -f ~/.local/share/fonts/
        ;;
esac

# Ensure Starship is installed and up to date.
mkdir -p ~/.local/bin
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --force --bin-dir ~/.local/bin
export PATH="~/.local/bin:$PATH"

# Ensure McFly is installed.
curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sh -s -- --git cantino/mcfly --to ~/.local/bin

# Ensure zoxide is installed.
curl -sS https://webinstall.dev/zoxide | bash

# Ensure dotfiles are downloaded.
mkdir -p ~/.dotfiles
wget -O ~/.dotfiles/starship.toml "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/starship.toml"
wget -O ~/.dotfiles/.commonrc "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/.commonrc"
wget -O ~/.dotfiles/.zshrc "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/.zshrc"
wget -O ~/.dotfiles/.bashrc "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/.bashrc"
wget -O ~/.dotfiles/.gitignore "https://raw.githubusercontent.com/danhje/dotfiles/main/.dotfiles/.gitignore"

# Ensure dotfiles are symlinked.
case $shell_name in
    *"zsh"* )
        rm -f ~/.zshrc
        ln -s ~/.dotfiles/.zshrc ~/.zshrc
        ;;
    *"bash"* )
        rm -f ~/.bashrc
        ln -s ~/.dotfiles/.bashrc ~/.bashrc
        ;;
esac
mkdir -p ~/.config
rm -f ~/.config/starship.toml
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml

# Configure git
git config --global core.excludesfile ~/.dotfiles/.gitignore

# Source dotfiles.
case $shell_name in
    *"zsh"* )
        test -e ~/.zshrc && . ~/.zshrc
        ;;
    *"bash"* )
        test -e ~/.bashrc && . ~/.bashrc
        ;;
esac

# Finished
echo "Done. Remember to move or symlink any local rc to ~/.localrc"
