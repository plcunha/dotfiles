# Neovim Setup Script for Windows

$nvimConfigPath = Join-Path $env:LOCALAPPDATA "nvim"
$dotfilesPath = Split-Path -Parent $PSScriptRoot

# Backup existing nvim config
if (Test-Path $nvimConfigPath) {
    Write-Host "Backing up existing nvim config to $nvimConfigPath.backup..."
    Move-Item -Path $nvimConfigPath -Destination "$nvimConfigPath.backup"
}

# Create symlink
Write-Host "Creating symlink for nvim config..."
New-Item -ItemType Junction -Path $nvimConfigPath -Target "$dotfilesPath\config\nvim"

Write-Host "✓ Neovim config linked successfully"
Write-Host ""
Write-Host "First time setup:"
Write-Host "1. Open nvim"
Write-Host "2. Run :Mason to install LSP servers"
Write-Host "3. Run :TSUpdate to install Treesitter parsers"
