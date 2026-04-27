#!/bin/bash

set -e

echo "==> Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

echo "==> Instalando dependências..."
sudo apt install -y curl wget git unzip xz-utils zip libfuse2

echo "==> Instalando Fish Shell..."
sudo apt install -y fish

echo "==> Instalando Neovim (versão latest)..."
wget -O /tmp/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
sudo tar -xzf /tmp/nvim-linux64.tar.gz -C /opt
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm /tmp/nvim-linux64.tar.gz

echo "==> Instalando Mise (gerenciador de versões)..."
curl https://mise.jdx.dev/install.sh | sh

echo "==> Configurando Fish como shell padrão..."
echo "/home/$USER/.local/bin/fish" | sudo tee /etc/shells
chsh -s /home/$USER/.local/bin/fish

echo "==> Instalando Tools essenciais com Mise..."
~/.local/bin/mise install node@latest
~/.local/bin/mise install python@latest

echo "==> Instalando Fisher (gerenciador de plugins do Fish)..."
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

echo "==> Baixando dotfiles..."
cd ~
git clone https://github.com/pbc/dotfiles.git ~/.dotfiles 2>/dev/null || cd ~/.dotfiles && git pull
ln -sf ~/.dotfiles/config/fish ~/.config/fish
ln -sf ~/.dotfiles/config/nvim ~/.config/nvim
ln -sf ~/.dotfiles/config/mise ~/.config/mise

echo "==> Instalando plugins do Fish..."
fish -c "fisher install"

echo "==> Instalando fontes Nerd Font..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget -q --show-progress https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -O JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -f

echo ""
echo "==> Setup completo!"
echo "==> Execute: fish"
echo "==> No Neovim, execute: :Lazy sync"
