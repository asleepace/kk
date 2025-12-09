#!/bin/bash
# kk - personal command namespace

KK_HOME="$HOME/.kk/commands"
source "$HOME/.kk/lib/common"

kk_list() {
  echo -e "${CYAN}kk${NC} - personal command namespace"
  echo ""
  echo -e "${DIM_GRAY}Usage:${NC} kk <command> [args...]"
  echo ""
  echo -e "${DIM_GRAY}Commands:${NC}"
  for cmd in "$KK_HOME"/*; do
    [ -x "$cmd" ] || continue
    name=$(basename "$cmd")
    desc=$(grep '^DESCRIPTION=' "$cmd" | head -1 | cut -d'"' -f2)
    printf "  ${GREEN}%-14s${NC} ${DIM_GRAY}%s${NC}\n" "$name" "$desc"
  done
  echo ""
}

if [ -z "$1" ] || [ "$1" = "list" ] || [ "$1" = "--help" ]; then
  kk_list
  exit 0
fi

cmd="$1"
shift

if [ -x "$KK_HOME/$cmd" ]; then
  if [ "$1" = "--help" ]; then
    desc=$(grep '^DESCRIPTION=' "$KK_HOME/$cmd" | head -1 | cut -d'"' -f2)
    echo -e "${GREEN}$cmd${NC} - $desc"
    echo ""
    grep '^#' "$KK_HOME/$cmd" | grep -v '^#!/' | sed 's/^# //'
    exit 0
  fi
  exec "$KK_HOME/$cmd" "$@"
else
  kk_die "Unknown command: $cmd"
fi