#!/usr/bin/env bash
# Install nvm, Node 22, and the Codex CLI inside WSL
# Run inside a WSL shell (e.g., after running setup_wsl.ps1)

set -euo pipefail

# Install nvm if not present
if [ -d "$HOME/.nvm" ]; then
  echo "nvm detected"
else
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  # Load nvm immediately for this shell session
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

# Ensure nvm is available
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install Node.js 22
echo "Installing Node.js 22 via nvm..."
nvm install 22
nvm use 22

# Install Codex globally
echo "Installing @openai/codex globally..."
npm i -g @openai/codex

echo "Done. Verify by running: which codex || echo 'codex not found'"
