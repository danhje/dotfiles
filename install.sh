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

# Ensure Starship config is downloaded.
mkdir -p ~/.config
wget -nc -O ~/.config/starship.toml "https://raw.githubusercontent.com/danhje/dotfiles/main/starship.toml"
                                     https://raw.githubusercontent.com/danhje/dotfiles/main/starship.toml

# Ensure Starship is initialized.
shell_name=$(sh -c 'ps -p $$ -o ppid=' | xargs ps -o comm= -p)
if [[ $shell_name == "-zsh" ]]; then
    eval "$(starship init zsh)"
elif [[ $shell_name == "-bash" ]]; then
    eval "$(starship init bash)"
elif [[ $shell_name == "-fish" ]]; then
    starship init fish | source
fi

# Ensure terminal dotfile is updated to initialize starship on every new terminal session.
