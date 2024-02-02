local options = {
  nu = true,
  relativenumber = true,
  numberwidth = 2,

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
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

  colorcolumn = "80",
  pumheight = 10,

  cursorline = true,

  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false, -- Disable folding at startup.

  nrformats = "bin,octal,hex,alpha"
}


for k, v in pairs(options) do
  vim.opt[k] = v
end
