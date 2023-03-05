local options = {
    nu = true,
    relativenumber = true,
    numberwidth = 4,

    tabstop = 4,
    softtabstop = 4,
    shiftwidth= 4,
    expandtab = true,

    smartindent = true,
    smartcase = true,

    wrap = false,

    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,

    hlsearch = false,
    incsearch = true,

    termguicolors = true,

    scrolloff = 8,
    signcolumn = "yes",

    updatetime = 50,

    colorcolumn = "0",
    pumheight = 10,

    cursorline = true,
}

vim.g.mapleader = " "

for k, v in pairs(options) do
    vim.opt[k] = v
end
