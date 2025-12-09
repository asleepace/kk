# kk

A collection of useful bash scripts.

## Commands

| Command | Description |
|---------|-------------|
| `download` | Download files from droplet |
| `fetch-json` | Fetch URL and parse as JSON |
| `kill-port` | Kill process running on a port |
| `my-ip` | Get your public IPv4 address |
| `no-color` | Reset terminal colors |
| `scan` | Scan ports on a host |
| `snoop` | Get network info for a domain |

## Examples
```bash
# download remote files or folders from SSH
kk download ~/asleepace.com
kk download ~/asleepace.com ~/Desktop

# fetch json via curl and jq
kk fetch-json https://api.github.com/users/asleepace

# list all commands
kk
```

## Installation
```bash
# clone the repo
git clone git@github.com:asleepace/kk.git ~/.kk

# make scripts executable
chmod +x ~/.kk/kk ~/.kk/commands/*

# add to PATH
echo 'export PATH="$HOME/.kk:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

For auto-completions to work, please add the following to your `~/.zshrc`

```bash
# kk autocompletions
_kk_completions() {
  local commands
  commands=($(ls -1 ~/.kk/commands))
  _describe 'command' commands
}
compdef _kk_completions kk
```

Then run `source ~/.zshrc`

## Adding Commands

Create a new file in `~/.kk/commands/`:
```bash
#!/bin/bash
# Short description of command
# Usage: kk my-command <arg>
# Example: kk my-command foo

DESCRIPTION="Short description for list view"
source "$HOME/.kk/lib/common"
kk_trap_errors

# your code here
```

Then `chmod +x ~/.kk/commands/my-command`.

## License

MIT