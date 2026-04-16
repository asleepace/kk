#compdef kk

# Inlined from lib/common's kk_list_secrets — sourcing common here would
# enable `set -euo pipefail` in the interactive shell.
_kk_complete_list_secrets() {
  security dump-keychain 2>/dev/null \
    | awk -F'"' '/svce/ { svc=$4 } /acct/ && svc { print svc; svc="" }' \
    | grep '^kk\.' \
    | sed 's/^kk\.//' \
    | sort
}

_kk_completions() {
  local subcmd="${words[2]}"

  if (( CURRENT == 2 )); then
    local -a commands
    commands=(${(f)"$(ls -1 ~/.kk/commands)"})
    _describe 'command' commands
    return
  fi

  case "$subcmd" in
    rename-screenshot)
      (( CURRENT == 3 )) && _files -g '*.png'
      ;;
    get-secret)
      if (( CURRENT == 3 )); then
        local -a secrets
        secrets=(${(f)"$(_kk_complete_list_secrets)"})
        _describe 'secret' secrets
      fi
      ;;
    set-secret)
      if (( CURRENT == 3 )); then
        local -a secrets
        secrets=(${(f)"$(_kk_complete_list_secrets)"})
        _describe 'existing secret (or new name)' secrets
      fi
      ;;
  esac
}

compdef _kk_completions kk
