-- local builtin = require('telescope.builtin')
-- --
-- --
-- pcall(require('telescope').load_extension, 'fzf')
-- --
-- -- -- See `:help telescope.builtin`
-- --

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>?",       function() require("telescope.builtin").oldfiles() end,              desc = "[?] Find recently opened files" },
    { "<leader>sf",      function() require("telescope.builtin").find_files() end,            desc = "[S]earch [F]iles" },
    { "<leader>sh",      function() require("telescope.builtin").help_tags() end,             desc = "[S]earch [H]elp" },
    { "<leader>sw",      function() require("telescope.builtin").grep_string() end,           desc = "[S]earch current [W]ord" },
    { "<leader>sg",      function() require("telescope.builtin").live_grep() end,             desc = "[S]earch by [G]rep" },
    { "<leader>sd",      function() require("telescope.builtin").diagnostics() end,           desc = "[S]earch [D]iagnostics" },
    { "<leader>ss",      function() require("telescope.builtin").lsp_workspace_symbols() end, desc = "[S]earch Lsp Workspace [S]ymbols" },
    { "<leader><space>", function() require("telescope.builtin").buffers() end,               desc = "[ ] Find existing buffers" },
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = "[/] Fuzzily search in current buffer"
    }
  },
  config = function(telescope, _)
    pcall(require('telescope').load_extension, 'fzf')
  end
}
