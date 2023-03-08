. /usr/share/bash-completion/completions/git

. ~/.dotfiles/.commonrc

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

eval "$(starship init bash)"
eval "$(mcfly init bash)"
eval "$(zoxide init bash)"

# rtx
export RTX_SHELL=bash

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
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("~/.cargo/bin/rtx" hook-env -s bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if ! [[ "${PROMPT_COMMAND:-}" =~ _rtx_hook ]]; then
  PROMPT_COMMAND="_rtx_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi
