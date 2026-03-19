require "nvchad.mappings"

-- Remove NvChad's default nvim-tree keybinding since nvim-tree is removed
vim.keymap.del("n", "<leader>e")

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Move selected lines up and down with Shift+K and Shift+J
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })

-- ============================================
-- ATALHOS OTIMIZADOS PARA JOGADORES DE CS
-- Evita conflitos com binds comuns (WASD, Ctrl, Shift, Alt)
-- ============================================

-- LEADER KEY: Space (mantido - não conflita)
-- Usar <leader> como prefixo para comandos principais

-- FILE MANAGEMENT (Superfile + NvimTree)
-- <leader>e  - NvimTree (file tree lateral)
-- <leader>E  - Superfile (gerenciador TUI fullscreen)
-- <leader>ee - Superfile no diretório atual
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>E", "<cmd>terminal spf<CR>i", { desc = "Superfile" })
map("n", "<leader>ee", "<cmd>terminal spf %:p:h<CR>i", { desc = "Superfile (current dir)" })

-- BUFFER NAVIGATION (Alt + Setas - não conflita com CS)
-- Alt+Left/Right - Navegar entre buffers
-- Alt+Up/Down    - Primeiro/Último buffer
map("n", "<M-Left>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<M-Right>", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "<M-Up>", "<CMD>bfirst<CR>", { desc = "First buffer" })
map("n", "<M-Down>", "<CMD>blast<CR>", { desc = "Last buffer" })
map("i", "<M-Left>", "<ESC><CMD>bprevious<CR>", { desc = "Previous buffer" })
map("i", "<M-Right>", "<ESC><CMD>bnext<CR>", { desc = "Next buffer" })
map("i", "<M-Up>", "<ESC><CMD>bfirst<CR>", { desc = "First buffer" })
map("i", "<M-Down>", "<ESC><CMD>blast<CR>", { desc = "Last buffer" })

-- BUFFER MANAGEMENT (Leader + b*)
-- <leader>bc - Fechar buffer atual
-- <leader>bo - Fechar outros buffers
-- <leader>ba - Fechar todos buffers
map("n", "<leader>bc", "<CMD>bdelete<CR>", { desc = "Close current buffer" })
map("n", "<leader>bo", "<CMD>%bd|e#|bd#<CR>", { desc = "Close other buffers" })
map("n", "<leader>ba", "<CMD>%bd<CR>", { desc = "Close all buffers" })

-- TELESCOPE (Leader + f* - find)
-- <leader>ff - Find files
-- <leader>fg - Find grep (texto)
-- <leader>fb - Find buffers
-- <leader>fh - Find help
-- <leader>fr - Find recent files
-- <leader>fw - Find word under cursor
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Find word under cursor" })
map("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Find in current file" })

-- WINDOW MANAGEMENT (Leader + w*)
-- <leader>wv - Split vertical
-- <leader>wh - Split horizontal
-- <leader>wc - Close window
-- <leader>wo - Close others
-- <leader>we - Igualar tamanhos
map("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>wh", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>wc", "<C-w>c", { desc = "Close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })
map("n", "<leader>we", "<C-w>=", { desc = "Equalize windows" })
map("n", "<leader>ww", "<C-w>w", { desc = "Next window" })
map("n", "<leader>wp", "<C-w>p", { desc = "Previous window" })

-- WINDOW RESIZE (Ctrl + Shift + Setas)
-- Evita conflito com WASD e Ctrl normal
map("n", "<C-S-Up>", "<cmd>resize +2<CR>", { desc = "Increase height" })
map("n", "<C-S-Down>", "<cmd>resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-S-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-S-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })

-- TERMINAL (F keys - não conflita)
-- F12 - Terminal flutuante (toggleterm)
-- F11 - Terminal na parte inferior
-- F10 - Terminal na lateral
map("n", "<F12>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal float" })
map("n", "<F11>", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal bottom" })
map("n", "<F10>", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminal side" })
map("t", "<F12>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<F11>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<F10>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Terminal escape (Alt+Esc ou Ctrl+\)
map("t", "<M-Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- CODE NAVIGATION (Leader + c* ou g*)
-- gd - Go to definition
-- gr - Go to references
-- gi - Go to implementation
-- gD - Go to declaration
-- K  - Hover documentation (NvChad default)
-- <leader>ca - Code action
-- <leader>cr - Rename
-- <leader>cf - Format
-- <leader>cd - Diagnostic
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format code" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>c[", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "<leader>c]", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- GIT (Leader + g*)
-- <leader>gg - LazyGit (se instalado)
-- <leader>gs - Git status
-- <leader>gb - Git blame
-- <leader>gd - Git diff
map("n", "<leader>gs", "<cmd>terminal git status<CR>i", { desc = "Git status" })
map("n", "<leader>gb", "<cmd>terminal git branch<CR>i", { desc = "Git branch" })
map("n", "<leader>gl", "<cmd>terminal git log --oneline -20<CR>i", { desc = "Git log" })

-- SESSIONS (F keys)
-- F5 - Save session
-- F6 - Load session
map("n", "<F5>", "<cmd>mksession! ~/.nvim-session.vim<CR>", { desc = "Save session" })
map("n", "<F6>", "<cmd>source ~/.nvim-session.vim<CR>", { desc = "Load session" })

-- QUICK ACTIONS (Leader + q* ou a*)
-- <leader>qq - Quit
-- <leader>qa - Quit all
-- <leader>qs - Save and quit
-- <leader>w  - Save
-- <leader>W  - Save all
map("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit all" })
map("n", "<leader>qs", "<cmd>wq<CR>", { desc = "Save and quit" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>W", "<cmd>wa<CR>", { desc = "Save all" })

-- TOGGLES (Leader + t*)
-- <leader>tn - Toggle numbers
-- <leader>tr - Toggle relative numbers
-- <leader>tw - Toggle wrap
-- <leader>th - Toggle highlight search
map("n", "<leader>tn", "<cmd>set number!<CR>", { desc = "Toggle numbers" })
map("n", "<leader>tr", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative numbers" })
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })
map("n", "<leader>th", "<cmd>set hlsearch!<CR>", { desc = "Toggle highlight search" })

-- Helix-style keymaps
map("n", "x", "V", { desc = "Visual line mode" })
map("n", "gl", "$", { desc = "Go to end of line" })
map("n", "gs", "^", { desc = "Go to start of line" })
map("n", "ge", "G", { desc = "Go to end of file" })

-- Remap delete operations to use blackhole register
map("n", "d", '"_d', { desc = "Delete to blackhole register" })
map("n", "dd", '"_dd', { desc = "Delete line to blackhole register" })
map("v", "d", '"_d', { desc = "Delete selection to blackhole register" })
map("n", "D", '"_D', { desc = "Delete to end of line to blackhole register" })
-- map("n", "x", '"_x', { desc = "Delete character to blackhole register" })
-- map("n", "X", '"_X', { desc = "Delete character before cursor to blackhole register" })
map("n", "C", '"_C', { desc = "Change to end of line to blackhole register" })
map("n", "cc", '"_cc', { desc = "Change whole line to blackhole register" })
