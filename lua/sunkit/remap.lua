vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>e",  ":Lex 30<cr>")


-- Easy sourcing of config files
vim.keymap.set("n", "<leader><CR>", ":so %<CR>")

-- Jump cursor to new window after creating it
vim.keymap.set("n", "<C-w>v", "<C-w>v<C-w>l")
vim.keymap.set("n", "<C-w>s", "<C-w>s<C-w>j")

-- Resize window with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Moving highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeping cursor centered after jumping up and down
-- the page and searching text
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keeping origin buffer content after pasting over
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Seperating vim clipboard and system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")

-- Quickfix navigations
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")

-- Start typing to replace work currently under cursor
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Better tab navigation
vim.keymap.set("n", "<leader><Left>", ":tabp<CR>");
vim.keymap.set("n", "<leader><Right>", ":tabn<CR>");

-- Better terminal navigation
vim.keymap.set("t", "<C-w>h", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-w>j", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-w>k", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-w>l", "<C-\\><C-N><C-w>l", term_opts)
vim.keymap.set("t", "<leader><Left>", "<C-\\><C-N><cmd>tabp<CR>", term_opts)
vim.keymap.set("t", "<leader><Right>", "<C-\\><C-N><cmd>tabn<CR>", term_opts)
