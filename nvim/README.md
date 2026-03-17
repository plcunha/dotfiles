# Neovim Configuration

Portable NvChad v2.5 configuration with custom plugins and settings.

## Features

- **Base**: NvChad v2.5 framework
- **Theme**: tokyonight with transparent background
- **AI**: Supermaven for intelligent code completion
- **LSP**: Multi-language support (JavaScript, TypeScript, Go, Python/Svelte)
- **Navigation**: Telescope fuzzy finder
- **Formatting**: Conform.nvim (Biome for JS/TS/Lua)

## Installation

### Linux/macOS/WSL
```bash
./scripts/setup-nvim.sh
```

### Windows
```powershell
.\scripts\setup-nvim.ps1
```

## First-Time Setup

1. Open Neovim (plugins will auto-install)
2. Install LSP servers: `:Mason`
3. Install Treesitter parsers: `:TSUpdate`
4. Verify setup: `:checkhealth`

### Quick Start Commands

Open Neovim and run:
```vim
:Mason          " Install LSP servers
:TSUpdate        " Install Treesitter parsers
:checkhealth    " Verify setup
```

## Language Support

| Language | LSP Server | Formatter |
|----------|-----------|-----------|
| JavaScript/TS/React | ts_ls | Biome |
| Go | gopls | gofumpt |
| Python | ruff | - |
| Svelte | svelte | - |
| HTML/CSS | html, cssls | - |
| Lua | lua_ls | stylua |

## Key Mappings

| Key | Action |
|-----|--------|
| `jk` | Exit insert mode |
| `x` | Visual line mode |
| `gl` | Go to end of line |
| `gs` | Go to start of line |
| `ge` | Go to end of file |
| `d` | Delete (blackhole register) |
| `Alt+Left/Right` | Previous/Next buffer |
| `Alt+Up/Down` | First/Last buffer |
| `<leader>ff` | Telescope find files |
| `<leader>fg` | Telescope live grep |

## Custom Features

- **Spell checker**: Enabled for British English
- **Relative line numbers**: Always on
- **Helix-inspired keymaps**: `gl`, `gs`, `ge`, `x`
- **Buffer navigation**: Alt-arrow keys
- **Paste-safe delete**: Uses blackhole register
