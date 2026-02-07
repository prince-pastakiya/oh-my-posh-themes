#!/usr/bin/env bash
set -e

echo "🔧 Setting up oh-my-posh with official theme..."

# Install oh-my-posh only if missing
if ! command -v oh-my-posh >/dev/null 2>&1; then
  echo "📦 Installing oh-my-posh..."
  curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin
fi

# Create theme directory
mkdir -p "$HOME/.poshthemes"

# Download official theme (jandedobbeleer)
THEME_URL="https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json"
curl -fsSL "$THEME_URL" -o "$HOME/.poshthemes/jandedobbeleer.omp.json"

# Add to .bashrc (only once)
if ! grep -q "oh-my-posh init bash" "$HOME/.bashrc" 2>/dev/null; then
  {
    echo
    echo "# Enable oh-my-posh official theme"
    echo 'eval "$(oh-my-posh init bash --config $HOME/.poshthemes/jandedobbeleer.omp.json)"'
  } >> "$HOME/.bashrc"
fi

# Ensure login shells source bashrc
if ! grep -q "source ~/.bashrc" "$HOME/.bash_profile" 2>/dev/null; then
  echo '[ -f ~/.bashrc ] && source ~/.bashrc' >> "$HOME/.bash_profile"
fi

echo "✅ oh-my-posh official theme activated. Open a new terminal to see it."
