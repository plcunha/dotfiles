# Quick Start Guide

## New to this repo? Start here.

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Set up Neovim (most important for daily work)
./scripts/setup-nvim.sh      # Linux/macOS/WSL
# or
.\scripts\setup-nvim.ps1     # Windows

# 3. Open Neovim - plugins will install automatically
nvim

# 4. In nvim, install LSP servers
:Mason
# Press 'i' on gopls, ts_ls, lua_ls, ruff, html, cssls, svelte

# 5. Install Treesitter for syntax highlighting
:TSUpdate

# 6. Verify everything works
:checkhealth
```

## Done! Your nvim is ready.

What you now have:
- ✅ NvChad v2.5 configured
- ✅ tokyonight theme
- ✅ Supermaven AI completion
- ✅ LSP for JS/TS/Go/Python/Svelte
- ✅ Telescope file finder
- ✅ Biome + stylua formatters

## Key Shortcuts (must know)

| Shortcut | What it does |
|----------|--------------|
| `<leader>ff` | Find files |
| `gd` | Go to definition |
| `jk` | Exit insert mode |
| `Alt+Left/Right` | Next/prev buffer |
| `d` | Delete (doesn't yank) |

## Need help?

- Full nvim docs: `nvim/README.md`
- Quick reference: `nvim/QUICKREF.md`
- Setup details: `nvim/SETUP_SUMMARY.md`
- Overall docs: `README.md`

## Want to set up everything?

Run the main sync script:
```bash
./sync.sh -y    # Sync fish, sketchybar, aerospace, etc.
```
