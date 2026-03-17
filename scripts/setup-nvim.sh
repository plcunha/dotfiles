#!/bin/bash
# Neovim setup script - works on Linux/macOS/WSL

set -e

NVIM_CONFIG_DIR="$HOME/.config/nvim"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup existing nvim config
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Backing up existing nvim config to $NVIM_CONFIG_DIR.backup"
    mv "$NVIM_CONFIG_DIR" "$NVIM_CONFIG_DIR.backup"
fi

# Create symlink
echo "Creating symlink for nvim config..."
mkdir -p "$HOME/.config"
ln -s "$DOTFILES_DIR/config/nvim" "$NVIM_CONFIG_DIR"

echo "✓ Neovim config linked successfully"
echo ""
echo "First time setup:"
echo "1. Open nvim"
echo "2. Run :Mason to install LSP servers"
echo "3. Run :TSUpdate to install Treesitter parsers"
