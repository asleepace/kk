# kk

A collection of useful bash scripts.

## Commands

| Command | Description |
|---------|-------------|
| `download` | Download files from droplet |
| `fetch-json` | Fetch URL and parse as JSON |

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