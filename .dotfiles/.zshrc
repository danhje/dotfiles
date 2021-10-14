. ~/.dotfiles/.commonrc

export ZSH="~/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
plugins=(git)
. "$ZSH/oh-my-zsh.sh"

eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
