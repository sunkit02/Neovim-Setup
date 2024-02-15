return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    { "<leader>gs",  vim.cmd.Git,          desc = "Open fugitive" },
    { "<leader>gl",  "<cmd>Git log<CR>",   desc = "Open [G]it [l]ogs" },
    { "<leader>gp",  "<cmd>Git push<CR>",  desc = "Open [G]it [p]ush" },
    { "<leader>gP",  "<cmd>Git pull<CR>",  desc = "Open [G]it [p]ull" },
    { "<leader>gaa", "<cmd>Git add .<CR>", desc = "Open [G]it [a]ll" },
  }
}
