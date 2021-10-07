# `dotfiles`

I use zsh on my Mac, but also have to use bash on other systems from time to time. This repo is my attempt at creating a dotfile schema that can be installed with a one-liner, and that allows for a similar experience across different shells and OSes, and at the same time allows for local and shell-specific modifications. 

## Usage

To get this config without any modification:

```shell
source <(curl -fsSL https://raw.githubusercontent.com/danhje/dotfiles/main/install.sh)
```

⚠️ Warning, this will replace your config with mine!