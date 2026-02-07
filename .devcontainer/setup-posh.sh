#!/usr/bin/env bash
set -e

echo "🔧 Installing oh-my-posh..."

# Install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin

echo "🎨 Setting up HackerShell theme..."

# Create theme directory
mkdir -p ~/.poshthemes

# Copy theme from repo to home
cp /workspaces/oh-my-posh-themes/GitLab.omp.json ~/.poshthemes/

# Enable oh-my-posh in bash (only once)
if ! grep -q "oh-my-posh init bash" ~/.bashrc; then
  echo '' >> ~/.bashrc
  echo '# Enable oh-my-posh' >> ~/.bashrc
  echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/GitLab.omp.json)"' >> ~/.bashrc
fi

echo "✅ HackerShell activated"
