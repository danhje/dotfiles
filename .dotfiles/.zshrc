. ~/.dotfiles/.commonrc

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

export RTX_SHELL=zsh

rtx() {
  local command
  command="${1:-}"
  if [ "$#" = 0 ]; then
    command ~/.cargo/bin/rtx
    return
  fi
  shift

  case "$command" in
  deactivate|shell)
    eval "$(~/.cargo/bin/rtx "$command" "$@")"
    ;;
  *)
    command ~/.cargo/bin/rtx "$command" "$@"
    ;;
  esac
}

_rtx_hook() {
  trap -- '' SIGINT;
  eval "$("~/.cargo/bin/rtx" hook-env -s zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_rtx_hook]+1}" ]]; then
  precmd_functions=( _rtx_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_rtx_hook]+1}" ]]; then
  chpwd_functions=( _rtx_hook ${chpwd_functions[@]} )
fi
