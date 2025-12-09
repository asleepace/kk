#!/bin/bash

# kk - personal command namespace
# root entry file

KK_HOME="$HOME/.kk/commands"

if [ -z "$1" ]; then
  echo "Usage: kk <command> [args...]"
  echo ""
  echo "Commands:"
  for cmd in "$KK_HOME"/*; do
    [ -x "$cmd" ] || continue
    name=$(basename "$cmd")
    desc=$(grep '^DESCRIPTION=' "$cmd" | head -1 | cut -d'"' -f2)
    printf "  %-12s %s\n" "$name" "$desc"
  done
  exit 0
fi

cmd="$1"
shift

if [ -x "$KK_HOME/$cmd" ]; then
  if [ "$1" = "--help" ]; then
    desc=$(grep '^DESCRIPTION=' "$KK_HOME/$cmd" | head -1 | cut -d'"' -f2)
    echo "$cmd - $desc"
    echo ""
    grep '^#' "$KK_HOME/$cmd" | grep -v '^#!/' | sed 's/^# //'
    exit 0
  fi
  exec "$KK_HOME/$cmd" "$@"
else
  echo "Unknown command: $cmd"
  exit 1
fi