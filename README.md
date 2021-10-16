# `dotfiles`

I use zsh on my Mac, but also have to use bash on other systems from time to time. This repo is my attempt at creating a dotfile schema that provides a similar experience across different shells and OSes, and at the same time allows for local and shell-specific modifications. It can be installed and updated with a one-liner to make the process of updating to the latest config as quick as possible.

## Usage

To get this config without any modification:

```shell
source <(curl -fsSL https://raw.githubusercontent.com/danhje/dotfiles/main/install.sh)
```

⚠️ Warning, this will irrevocably replace your config with mine, and install a bunch of stuff on your system.
