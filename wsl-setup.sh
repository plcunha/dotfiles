#!/bin/bash
# WSL-specific setup script (Ubuntu/Debian based)

set -euo pipefail

# Detect WSL and set user home properly
if [[ -f /etc/wsl.conf ]]; then
    WSL_USER_HOME=$(wslvar -u USERNAME 2>/dev/null || echo "$USER")
    WSL_USER_HOME="/home/$WSL_USER_HOME"
else
    WSL_USER_HOME="$HOME"
fi

echo "==> Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

echo "==> Instalando dependências..."
sudo apt install -y curl wget git unzip xz-utils zip libfuse2

echo "==> Instalando Fish Shell..."
sudo apt install -y fish

echo "==> Instalando Neovim (versão latest)..."
NVIM_VERSION=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -Po '"tag_name": "\K.*?(?=")' | sed 's/v//')
echo "==> Baixando Neovim v${NVIM_VERSION}..."
wget -q -O /tmp/nvim-linux64.tar.gz "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux64.tar.gz"
sudo tar -xzf /tmp/nvim-linux64.tar.gz -C /opt
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm /tmp/nvim-linux64.tar.gz

echo "==> Instalando Mise (gerenciador de versões)..."
curl https://mise.jdx.dev/install.sh | sh

echo "==> Configurando Fish como shell padrão..."
FISH_PATH="$WSL_USER_HOME/.local/bin/fish"
echo "$FISH_PATH" | sudo tee /etc/shells > /dev/null
sudo chsh -s "$FISH_PATH"

echo "==> Instalando Tools essenciais com Mise..."
"$WSL_USER_HOME/.local/bin/mise" install node@latest
"$WSL_USER_HOME/.local/bin/mise" install python@latest

echo "==> Instalando Fisher (gerenciador de plugins do Fish)..."
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

echo "==> Baixando dotfiles..."
cd ~ || exit
# Use environment variable or fallback to user's repo
DOTFILES_REPO="${DOTFILES_REPO_URL:-https://github.com/plcunha/dotfiles.git}"
git clone "$DOTFILES_REPO" ~/.dotfiles 2>/dev/null || cd ~/.dotfiles && git pull
ln -sf ~/.dotfiles/config/fish ~/.config/fish 2>/dev/null || true
ln -sf ~/.dotfiles/config/nvim ~/.config/nvim 2>/dev/null || true
ln -sf ~/.dotfiles/config/mise ~/.config/mise 2>/dev/null || true

echo "==> Instalando plugins do Fish..."
fish -c "fisher install"

echo "==> Instalando fontes Nerd Font..."
NERD_FONT_VERSION="${NERD_FONT_VERSION:-v3.4.0}"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget -q --show-progress "https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONT_VERSION}/JetBrainsMono.zip" -O JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -f

echo ""
echo "==> Setup completo!"
echo "==> Execute: fish"
echo "==> No Neovim, execute: :Lazy sync"
