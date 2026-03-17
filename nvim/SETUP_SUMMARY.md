# Neovim Configuration - Setup Summary

## What Was Configured

### Base Framework
- **NvChad v2.5**: Modern Neovim configuration framework
- **Theme**: tokyonight-night with transparent background
- **Plugin Manager**: lazy.nvim (automatic installation on first run)

### Core Plugins Installed
| Plugin | Purpose |
|--------|---------|
| nvim-cmp | Autocompletion |
| nvim-lspconfig | LSP configuration |
| mason.nvim | LSP server installer |
| telescope.nvim | Fuzzy finder |
| nvim-treesitter | Syntax highlighting |
| conform.nvim | Code formatting |
| Comment.nvim | Comment toggling |
| supermaven-nvim | AI code completion |

### Language Support
- **JavaScript/TypeScript/React**: ts_ls + Biome formatter
- **Go**: gopls with gofumpt formatting
- **Python**: ruff (LSP + linter)
- **Svelte**: svelte language server
- **HTML/CSS**: html & cssls servers
- **Lua**: lua_ls + stylua formatter

### Custom Key Features
1. **Helix-style navigation**: `x` for visual lines, `gl/gs/ge` for movement
2. **Buffer navigation**: Alt+arrow keys
3. **Paste-safe delete**: Uses blackhole register (`"_"`)
4. **Spell checking**: British English
5. **Relative line numbers**: Always enabled
6. **Leader key**: Space

## How to Use

### Initial Setup
```bash
# 1. Run setup script for your platform
./scripts/setup-nvim.sh      # Linux/macOS/WSL
.\scripts\setup-nvim.ps1     # Windows

# 2. Open nvim (plugins auto-install)
nvim

# 3. Install LSP servers
:Mason

# 4. Install syntax highlighting
:TSUpdate

# 5. Verify everything works
:checkhealth
```

### Daily Usage

**Navigation**
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Search in files
- `<leader>fb` - Find open buffers
- `gd` - Go to definition
- `gi` - Go to implementation
- `gD` - Go to declaration

**Editing**
- `jk` - Exit insert mode
- `x` - Visual line mode
- `d/ dd` - Delete (doesn't yank)
- `gl` - End of line
- `gs` - Start of line
- `ge` - End of file

**Buffers**
- `Alt+Left/Right` - Previous/Next buffer
- `Alt+Up/Down` - First/Last buffer
- `<leader>x` - Close buffer (NvChad default)

**LSP**
- `K` - Show documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `:Mason` - Manage LSP servers

### Working Across Environments

**Your Config Location**
- Local: `~/dotfiles/config/nvim/`
- Linked to: `~/.config/nvim` (Linux/macOS/WSL) or `%LOCALAPPDATA%\nvim` (Windows)

**On New Machine**
1. Clone repo to `~/dotfiles`
2. Run setup script
3. Done - all plugins auto-install

**On Remote Server**
```bash
# Quick sync from local
rsync -avz ~/dotfiles/config/nvim/ user@server:~/.config/nvim/

# Or clone and setup
git clone your-repo.git ~/dotfiles && cd ~/dotfiles && ./scripts/setup-nvim.sh
```

## Maintenance

**Update config**: `git pull` in dotfiles repo
**Update plugins**: `:Lazy update` in nvim
**Update LSP servers**: `:Mason` and re-install as needed
**Update Treesitter**: `:TSUpdate`

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Plugins error | Delete `~/.local/share/nvim/lazy-lock.json` and reopen nvim |
| LSP not working | Open `:Mason` and reinstall server |
| No syntax highlighting | Run `:TSUpdate` |
| Theme not loading | Check term colors, try other theme in `chadrc.lua` |

## Project-Specific Notes

Look at `config/nvim/` for:
- `init.lua` - Main entry point
- `lua/options.lua` - Editor settings
- `lua/mappings.lua` - Keymappings
- `lua/chadrc.lua` - NvChad config (theme, UI)
- `lua/configs/` - Plugin configurations
- `lua/plugins/` - Plugin specifications
