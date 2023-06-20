local vim = vim

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Treat quick typing 'jk' in insert mode as <Esc>" })
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Treat <C-c> as actually hitting <Esc>" })
-- vim.keymap.set("n", "<leader>e",  ":Lex 30<cr>")
-- vim.keymap.set("n", "<A-l>", "<cmd>:set cc=0<CR>", { noremap = true, silent = true, desc = "Toggle highlight at position 80 for code alignment" })
-- vim.keymap.set("n", "<A-L>", "<cmd>:set cc=80<CR>", { noremap = true, silent = true, desc = "Toggle highlight at position 80 for code alignment" })
vim.keymap.set("n", "<Leader>l", "<cmd>lua ShowMaxWidthLine()<CR>", { noremap = true, silent = true, desc = "Toggle highlight at position 80 for code alignment" })
vim.keymap.set("n", "<Leader>L", "<cmd>lua HideMaxWidthLine()<CR>", { noremap = true, silent = true, desc = "Toggle highlight at position 80 for code alignment" })

-- Easy sourcing of config files
vim.keymap.set("n", "<leader><CR>", ":so %<CR>", { noremap = true, desc = "Source the current file" })

-- Jump cursor to new window after creating it
vim.keymap.set("n", "<C-w>v", "<C-w>v<C-w>l", { noremap = true, silent = true, desc = "Jump to new vertical split window after opening it" })
vim.keymap.set("n", "<C-w>s", "<C-w>s<C-w>j", { noremap = true, silent = true, desc = "Jump to new horizontal split window after opening it" })

-- Better navigation
-- Tabs
vim.keymap.set("n", "<leader>t", ":tabnew ", { noremap = true, desc = "Start typing name of file to open in new tab" })
vim.keymap.set("n", "<leader>f", "<cmd>tabe %<CR>", { noremap = true, silent = true, desc = "Open current window in a new tab as fullscreen" })

-- Commented out due to conflict with mappings for nvim-tmux-navigation plugin
-- Windows
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move one window left" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move one window down" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move one window up" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move one window right" })
-- Terminal
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true, desc="Move one window left in terminal mode" })
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true, desc="Move one window down in terminal mode" })
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true, desc="Move one window up in terminal mode" })
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true, desc="Move one window right in terminal mode" })

vim.keymap.set("t", "<leader><Left>", "<C-\\><C-N><cmd>tabp<CR>", { silent = true, desc="Move one tab to the left in terminal mode" })
vim.keymap.set("t", "<leader><Right>", "<C-\\><C-N><cmd>tabn<CR>", { silent = true, desc="Move one tab to the right in terminal mode" })
vim.keymap.set("n", "<leader>t", "<C-\\><C-N>:tabnew ", { noremap = true, silent = true, desc = "Start typing name of file to open in new tab" })

-- Resize window with arrows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { noremap = true, silent = true, desc = "Increase current window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { noremap = true, silent = true, desc = "Decrease current window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true, desc = "Decrease current window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true, desc = "Increase current window width" })
-- Resize terminal windows
vim.keymap.set("t", "<C-Up>", "<C-//><C-N><cmd>resize +2<CR>", { noremap = true, silent = true, desc = "Increase current window height" })
vim.keymap.set("t", "<C-Down>", "<C-//><C-N><cmd>resize -2<CR>", { noremap = true, silent = true, desc = "Decrease current window height" })
vim.keymap.set("t", "<C-Left>", "<C-//><C-N><cmd>vertical resize -2<CR>", { noremap = true, silent = true, desc = "Decrease current window width" })
vim.keymap.set("t", "<C-Right>", "<C-//><C-N><cmd>vertical resize +2<CR>", { noremap = true, silent = true, desc = "Increase current window width" })


-- Line manipulation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move highlighted line up one line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move highlighted line down one line" })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true, desc = "Append next line to the end of current line" })

-- Keeping cursor centered after jumping up and down the page and searching text
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Keep cursor centered after moving half a page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Keep cursor centered after moving half a page up" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "Keep cursor centered after jumping to the next matching regex search" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "Keep cursor centered after jumping to the previous matching regex search" })

-- Keeping origin buffer content after pasting over
vim.keymap.set("x", "<leader>p", "\"_dP", { noremap = true, silent = true, desc = "Keep original buffer content after pasting over highlighted text" })

-- Seperating vim clipboard and system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { noremap = true, silent = true, desc = "Yank to system clipboard in normal mode" })
vim.keymap.set("v", "<leader>y", "\"+y", { noremap = true, silent = true, desc = "Yank to system clipboard in visual mode" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { noremap = true, silent = true, desc = "Yank entire line to system clipboard" })
vim.keymap.set("n", "<leader>P", "\"+p", { noremap = true, silent = true, desc = "Paste from system clipboard in normal mode" })
vim.keymap.set("v", "<leader>P", "\"+p", { noremap = true, silent = true, desc = "Paste from system clipboard in visual mode" })

-- Deleting to void buffer
vim.keymap.set("n", "<leader>d", "\"_d", { noremap = true, silent = true, desc = "Deleting current line to void buffer" })

-- Quickfix navigations
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { noremap = true, silent = true, desc = "Next item on quickfix list and center cursor" })
vim.keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz", { noremap = true, silent = true, desc = "Previous item on quickfix list and center cursor" })
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { noremap = true, silent = true, desc = "Next item in current buffer and center cursor" })
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { noremap = true, silent = true, desc = "Previous item in current buffer and center cursor" })
vim.keymap.set("n", "<C-q>", "<cmd>lua ToggleQuickFixList()<CR>", { noremap = true, silent = true, desc = "Previous item in current buffer and center cursor" })


-- Start typing to replace work currently under cursor
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { noremap = true, silent = true, desc = "Replace word under cursor in buffer" })
-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { noremap = true, silent = true, desc = "Make current file executable by running 'chmod +x'" })
