# Neovim Config Quick Reference

## Usage Across Different Environments

### Local Machine
```bash
cd ~/dotfiles
./scripts/setup-nvim.sh    # Linux/macOS/WSL
# or
.\scripts\setup-nvim.ps1   # Windows
```

### Remote Server (SSH)
```bash
# From local machine, push config to server
rsync -avz ~/dotfiles/config/nvim/ user@server:~/.config/nvim/

# Or clone repo on server and symlink
git clone your-repo.git ~/dotfiles
cd ~/dotfiles
./scripts/setup-nvim.sh
```

### Development Containers (Docker/K8s)
```dockerfile
# Add to your Dockerfile
RUN mkdir -p ~/.config
COPY config/nvim ~/.config/nvim

# Or mount during development
# docker run -v ~/dotfiles/config/nvim:/root/.config/nvim my-image
```

## Quick Checklist

After setup, verify:
- [ ] Neovim opens without errors
- [ ] NvChad theme loads
- [ ] LSP works (`:Mason` shows installed servers)
- [ ] Telescope works (`<leader>ff`)
- [ ] Supermaven suggestions appear
- [ ] `:checkhealth` reports OK

## Common Issues

**Plugin errors**: Delete lazy lock and reload
```bash
rm ~/.local/share/nvim/lazy-lock.json
nvim
```

**LSP not working**: Reinstall server via Mason
```vim
:Mason
# Navigate to server, press 'i' to install
```

**Treesitter errors**: Update parsers
```vim
:TSUpdate
```

## Adding New Languages

Edit `config/nvim/lua/plugins/init.lua`:
```lua
opts = {
  ensure_installed = {
    "rust",
    "python",
    -- add your language here
  },
},
```

Then `:TSUpdate`

## Adding New LSP Servers

Edit `config/nvim/lua/configs/lspconfig.lua`:
```lua
vim.lsp.config("your-lsp", {
  capabilities = capabilities,
  on_init = nvlsp.on_init,
})

vim.lsp.enable("your-lsp")
```

Then `:Mason` to install
