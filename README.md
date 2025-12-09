# kk

a collection of useful bash scripts

## Installation 

```bash
# create directory
mkdir ~/.kk && cd ~/.kk

# initialize project
git init
git remote add origin git@github.com:asleepace/kk.git

# make scripts executable (no .sh extension)
chmod +x ~/.kk/kk ~/.kk/commands/download

# add the following to .zshrc
echo 'export PATH="$HOME/.kk:$PATH"' >> ~/.zshrc
source ~/.zshrc
```