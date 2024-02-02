--
-- vim.keymap.set("i", "<Tab>", super_tab, { noremap = true, silent = true, desc = "Super tab" })
-- vim.keymap.set("i", "<A-c>", expand_luasnip, { noremap = true, silent = true, desc = "Expand or jump luasnip" })
--
-- luasnip.config.setup {}
--
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-Space>"] = cmp.mapping.complete {},
--     ["<CR>"] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     { name = "nvim_lsp" },
--     { name = "luasnip" },
--   },
--   window = {
--     completion = cmp.config.window.bordered(),
--     -- documentation = cmp.config.window.bordered(),
--   },
-- }
-- return {
--   -- LSP Support
--   "neovim/nvim-lspconfig",             -- Required
--   "williamboman/mason.nvim",           -- Optional
--   "williamboman/mason-lspconfig.nvim", -- Optional
--
--   -- Autocompletion
--   "hrsh7th/nvim-cmp",         -- Required
--   "hrsh7th/cmp-buffer",       -- Optional
--   "hrsh7th/cmp-path",         -- Optional
--   "saadparwaiz1/cmp_luasnip", -- Optional
--   "hrsh7th/cmp-nvim-lsp",     -- Required
--   "hrsh7th/cmp-nvim-lua",     -- Optional
--
--   -- Snippets
--   "L3MON4D3/LuaSnip",             -- Required
--   "rafamadriz/friendly-snippets", -- Optional
--   {
--     "VonHeikemen/lsp-zero.nvim",
--     branch = "v1.x",
--     main = "lsp-zero",
--     config = function(lsp, _)
--       -- lsp.preset("recommended")
--       -- lsp.ensure_installed({
--       --   'tsserver',
--       --   'eslint',
--       --   -- 'sumneko_lua',
--       --   'rust_analyzer',
--       -- })
--
--
--
--       -- lsp.set_preferences({
--       --   sign_icons = {}
--       -- })
--
--       lsp.on_attach(function(client, bufnr)
--         -- Disabling LSP syntax highlighting when in conflict with treesitter
--         client.server_capabilities.semanticTokensProvider = bufnr
--
--         vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, remap = false, desc = "[G]o to [D]efinition" })
--         vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, remap = false, desc = "[G]o to [D]eclaration" })
--         vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, remap = false, desc = "[G]et [R]eferences" })
--         vim.keymap.set("n", "gt", vim.lsp.buf.type_definition,
--           { buffer = bufnr, remap = false, desc = "[G]et [T]ype Definition" })
--         vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
--           { buffer = bufnr, remap = false, desc = "[G]et [I]mplementations" })
--         vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, remap = false, desc = "Hover over current symbol" })
--         vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol,
--           { buffer = bufnr, remap = false, desc = "Workspace symbols" })
--         vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,
--           { buffer = bufnr, remap = false, desc = "Open diagnostics floating window" })
--         vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, remap = false, desc = "Next diagnostic" })
--         vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, remap = false, desc = "Previous diagnostic" })
--         vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action,
--           { buffer = bufnr, remap = false, desc = "Display available code actions" })
--         vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = "Rename symbol" })
--         vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = bufnr, remap = false, desc = "Signature help" })
--       end)
--
--
--       local lspconfig = require('lspconfig')
--
--       lspconfig.lua_ls.setup {
--         settings = {
--           Lua = {
--             runtime = {
--               -- Tell the language server which version of Lua you're using
--               -- (most likely LuaJIT in the case of Neovim)
--               version = 'LuaJIT',
--             },
--             diagnostics = {
--               -- Get the language server to recognize the `vim` global
--               globals = {
--                 'vim',
--                 'require'
--               },
--             },
--             workspace = {
--               -- Make the server aware of Neovim runtime files
--               library = vim.api.nvim_get_runtime_file("", true),
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--               enable = false,
--             },
--           },
--         },
--       }
--
--       lsp.setup()
--     end
--   },
-- }

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect

      require('lsp-zero.settings').preset({})
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

      require('lsp-zero.cmp').extend()
      local luasnip = require("luasnip")


      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')

      local function expand_luasnip()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end

      vim.keymap.set("i", "<A-c>", expand_luasnip, { noremap = true, silent = true, desc = "Expand or jump luasnip" })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete {},
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      {
        'williamboman/mason-lspconfig.nvim',
        config = true,
      },
      {
        'williamboman/mason.nvim',
        config = true,
      },
    },
    config = function()
      -- This is where all the LSP shenanigans will live

      local lsp = require('lsp-zero')

      lsp.on_attach(function(client, bufnr)
        -- Disabling LSP syntax highlighting when in conflict with treesitter
        client.server_capabilities.semanticTokensProvider = bufnr

        vim.keymap.set("n", "gd", vim.lsp.buf.definition,
          { buffer = bufnr, remap = false, desc = "[G]o to [D]efinition" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
          { buffer = bufnr, remap = false, desc = "[G]o to [D]eclaration" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, remap = false, desc = "[G]et [R]eferences" })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition,
          { buffer = bufnr, remap = false, desc = "[G]et [T]ype Definition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
          { buffer = bufnr, remap = false, desc = "[G]et [I]mplementations" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, remap = false, desc = "Hover over current symbol" })
        vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol,
          { buffer = bufnr, remap = false, desc = "Workspace symbols" })
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,
          { buffer = bufnr, remap = false, desc = "Open diagnostics floating window" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, remap = false, desc = "Next diagnostic" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
          { buffer = bufnr, remap = false, desc = "Previous diagnostic" })
        vim.keymap.set("n", "gl", vim.diagnostic.open_float,
          { buffer = bufnr, remap = false, desc = "[G]et [I]mplementations" })
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action,
          { buffer = bufnr, remap = false, desc = "Display available code actions" })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = "Rename symbol" })
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
          { buffer = bufnr, remap = false, desc = "Signature help" })

        -- lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end
  }
}
