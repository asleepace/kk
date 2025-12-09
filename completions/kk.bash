_kk_completions() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local commands=$(ls -1 ~/.kk/commands)
  COMPREPLY=($(compgen -W "$commands" -- "$cur"))
}
complete -F _kk_completions kk