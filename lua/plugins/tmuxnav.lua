return {
  "alexghergh/nvim-tmux-navigation",
  opts = {
    disable_when_zoomed = false -- defaults to false
  },
  keys = {
    { "<C-h>", function () require("nvim-tmux-navigation").NvimTmuxNavigateLeft() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-j>", function () require("nvim-tmux-navigation").NvimTmuxNavigateDown() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-k>", function () require("nvim-tmux-navigation").NvimTmuxNavigateUp() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-l>", function () require("nvim-tmux-navigation").NvimTmuxNavigateRight() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-\\>", function () require("nvim-tmux-navigation").NvimTmuxNavigateLastActive() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-h>", function () require("nvim-tmux-navigation").NvimTmuxNavigateLeft() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-j>", function () require("nvim-tmux-navigation").NvimTmuxNavigateDown() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-k>", function () require("nvim-tmux-navigation").NvimTmuxNavigateUp() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-l>", function () require("nvim-tmux-navigation").NvimTmuxNavigateRight() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-\\>", function () require("nvim-tmux-navigation").NvimTmuxNavigateLastActive() end, noremap = true, desc = "Navigation within Tmux" },
    { "<C-Space>", function () require("nvim-tmux-navigation").NvimTmuxNavigateNext() end, noremap = true, desc = "Navigation within Tmux" },
  }
}

