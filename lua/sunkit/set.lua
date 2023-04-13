local vim = vim

local options = {
    nu = true,
    relativenumber = true,
    numberwidth = 4,

    tabstop = 4,
    softtabstop = 4,
    shiftwidth= 4,
    expandtab = true,

    smartindent = true,

    wrap = false,

    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,

    hlsearch = false,
    incsearch = true,
    ignorecase = true,
    smartcase = true,

    termguicolors = true,

    scrolloff = 8,
    signcolumn = "yes",

    updatetime = 50,
    timeout = true,
    timeoutlen = 300,

    colorcolumn = "0",
    pumheight = 10,

    cursorline = true,

    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldenable = false,                     -- Disable folding at startup.
}


for k, v in pairs(options) do
    vim.opt[k] = v
end

