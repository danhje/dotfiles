. /usr/share/bash-completion/completions/git

. ~/.dotfiles/.commonrc

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

eval "$(starship init bash)"
eval "$(mcfly init bash)"
eval "$(zoxide init bash)"
