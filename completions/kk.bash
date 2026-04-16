_kk_completions() {
  local commands

  if [[ "${words[2]}" == "rename-screenshot" && "${#words[@]}" -eq 3 ]]; then
    _files -g "*.png"
  elif [[ "${words[2]}" == "get-secret" && "${CURRENT}" -eq 3 ]]; then
    local secrets
    secrets=($(security dump-keychain 2>/dev/null \
      | awk -F'"' '/svce/ { svc=$4 } /acct/ && svc { print svc; svc="" }' \
      | grep '^kk\.' \
      | sed 's/^kk\.//' \
      | sort))
    _describe 'secret' secrets
  else
    commands=($(ls -1 ~/.kk/commands))
    _describe 'command' commands
  fi
}
compdef _kk_completions kk