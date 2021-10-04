# Ensure the Fira Code Nerd Font is installed.
if [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS
    mkdir -p ~/Library/Fonts/
    for type in Bold Light Medium Regular Retina; do wget -O ~/Library/Fonts//FiraCode-$type.ttf "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/$type/complete/Fira%20Code%20$type%20Nerd%20Font%20Complete.ttf?raw=true"; done
else
    mkdir -p ~/.local/share/fonts/
    for type in Bold Light Medium Regular Retina; do wget -O ~/.local/share/fonts//FiraCode-$type.ttf "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/$type/complete/Fira%20Code%20$type%20Nerd%20Font%20Complete.ttf?raw=true"; done
    fc-cache -f
fi
cd -

#curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip -o firacodetemp.zip
#unzip firacodetemp.zip -d /
#rm firacodetemp.zip

# Ensure starship is installed.

# Ensure starship config is downloaded.

# Ensure starship is initialized.

# Ensure terminal dotfile is updated to initialize starship on every new terminal session.
