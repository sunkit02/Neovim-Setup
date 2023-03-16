local nvim_tmux_nav = require('nvim-tmux-navigation')
nvim_tmux_nav.setup({
    disable_when_zoomed = false -- defaults to false
})

opts = { noremap = true, desc = "Navigation within Tmux" }

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, opts)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, opts)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, opts)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, opts)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, opts)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, opts)

vim.keymap.set("t", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, opts)
vim.keymap.set("t", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, opts)
vim.keymap.set("t", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, opts)
vim.keymap.set("t", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, opts)
vim.keymap.set("t", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, opts)
vim.keymap.set("t", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, opts)
