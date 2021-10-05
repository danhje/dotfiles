source ~/.commonrc

export ZSH="~/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
plugins=(git)
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
