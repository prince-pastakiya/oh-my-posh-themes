#!/usr/bin/env bash
set -e

echo "🔧 Setting up oh-my-posh..."

# Install oh-my-posh only if not installed
if ! command -v oh-my-posh >/dev/null 2>&1; then
  echo "📦 Installing oh-my-posh..."
  curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin
fi

echo "🎨 Setting up custom oh-my-posh theme..."

# Create theme directory
mkdir -p "$HOME/.poshthemes"

# Copy theme from repo to home
cp "$PWD/GitLab.omp.json" "$HOME/.poshthemes/GitLab.omp.json"

# Enable oh-my-posh in bash (only once)
if ! grep -q "oh-my-posh init bash" "$HOME/.bashrc" 2>/dev/null; then
  {
    echo
    echo "# Enable oh-my-posh"
    echo 'eval "$(oh-my-posh init bash --config $HOME/.poshthemes/GitLab.omp.json)"'
  } >> "$HOME/.bashrc"
fi

# Ensure bashrc is loaded for login shells (Codespaces fix)
if ! grep -q "source ~/.bashrc" "$HOME/.bash_profile" 2>/dev/null; then
  echo '[ -f ~/.bashrc ] && source ~/.bashrc' >> "$HOME/.bash_profile"
fi

echo "✅ oh-my-posh activated. Open a new terminal to see the theme."
