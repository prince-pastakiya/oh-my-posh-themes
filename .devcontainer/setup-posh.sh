#!/bin/bash
# make bin folder
mkdir -p $HOME/bin

# install Oh My Posh
curl -sSL https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -o $HOME/bin/oh-my-posh
chmod +x $HOME/bin/oh-my-posh

# make sure bin is in PATH
grep -qxF 'export PATH=$HOME/bin:$PATH' ~/.bashrc || echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

# set custom theme with custom name
THEME_PATH="$HOME/workspaces/oh-my-posh-themes/GitLab.omp.json"

grep -qxF "eval \"\$(oh-my-posh init bash --config $THEME_PATH --shell-name Prince@GitLab)\"" ~/.bashrc || \
echo "eval \"\$(oh-my-posh init bash --config $THEME_PATH --shell-name Prince@GitLab)\"" >> ~/.bashrc
