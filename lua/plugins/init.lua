return {
  "folke/which-key.nvim",

  { "folke/neoconf.nvim", cmd = "Neoconf" },

  "folke/neodev.nvim",

  -- Colorshemes
  {
    "rose-pine/neovim",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  {
    "mbbill/undotree",
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = "Toggle Undotree." },
    },
  },

  -- LSP
  "hrsh7th/cmp-nvim-lsp-signature-help",

  {
    "prettier/vim-prettier",
    build = "yarn install --frozen-lockfile --production",
    ft = { "javascript", "typescript", "css", "scss", "json", "graphql", "markdown", "vue", "yaml", "html" }
  },


  -- Comments
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },


  "nvim-lua/plenary.nvim",

  -- RGB and hex color display
  "norcalli/nvim-colorizer.lua",

  {
    -- Install markdown preview, use npx if available.
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    event = "BufEnter *.md",
    ft = { "markdown" },
    build = function(plugin)
      if vim.fn.executable "npx" then
        vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
      else
        vim.cmd [[Lazy load markdown-preview.nvim]]
        vim.fn["mkdp#util#install"]()
      end
    end,
    init = function()
      if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
    end,
  },

  {
    "barrett-ruth/live-server.nvim",
    build = "yarn global add live-server",
    opts = {
      args = { "--port=7000" }
    }
  },

  -- -- Rust tools
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^4', -- Recommended
  --   ft = { 'rust' },
  -- }

  "norcalli/nvim-colorizer.lua",
}
