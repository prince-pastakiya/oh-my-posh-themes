#!/usr/bin/env bash
set -e

echo "🔧 Installing oh-my-posh..."

# Install oh-my-posh (official)
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin

echo "🎨 Setting up custom oh-my-posh theme..."

# Create theme directory
mkdir -p "$HOME/.poshthemes"

# Copy theme from repo to home
cp "$PWD/GitLab.omp.json" "$HOME/.poshthemes/"

# Enable oh-my-posh in bash (only once)
if ! grep -q "oh-my-posh init bash" "$HOME/.bashrc"; then
  echo "" >> "$HOME/.bashrc"
  echo "# Enable oh-my-posh" >> "$HOME/.bashrc"
  echo "eval \"\$(oh-my-posh init bash --config \$HOME/.poshthemes/GitLab.omp.json)\"" >> "$HOME/.bashrc"
fi

echo "✅ oh-my-posh activated"
