. ~/.dotfiles/.commonrc

export HISTSIZE=1000
export SAVEHIST=2000

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

export ZSH="~/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
plugins=(git)
. "$ZSH/oh-my-zsh.sh"

eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
eval "$(zoxide init zsh)"
