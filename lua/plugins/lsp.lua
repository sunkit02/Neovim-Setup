return {
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect

      require("lsp-zero.settings").preset({})
    end
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
    config = function(_, _)
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "mlaursen/vim-react-snippets",
      -- "onsails/lspkind.nvim"
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

      require("lsp-zero.cmp").extend()
      require("vim-react-snippets").lazy_load()
      local luasnip = require("luasnip")


      -- And you can configure cmp even more, if you want to.
      local cmp = require("cmp")

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
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        formatting = {
          -- FIX: Remove the extra space left behind for showing "menu" field
          fields = { "abbr", "kind", "menu" },

          -- format = require("lspkind").cmp_format({
          --   maxwidth = 20,
          --   ellipsis_char = "...",
          --   show_labelDetails = false,
          -- })
        },
        sources = {
          { name = "nvim_lsp", priority_weight = 4 },
          { name = "path",     priority_weight = 3 },
          { name = "luasnip",  priority_weight = 3 },
          { name = "buffer",   priority_weight = 3 },
        },
        sorting = {
          priority_weight = 1.0,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end
  },
  {
    "williamboman/mason.nvim",
    config = true,
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "lua_ls", "rust_analyzer", "tsserver" },
          automatic_installation = { exclude = {} },
        },
      },
    },
    config = function()
      -- This is where all the LSP shenanigans will live

      local lsp = require("lsp-zero")

      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { remap = false, desc = "Next diagnostic" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { remap = false, desc = "Previous diagnostic" })
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, { remap = false, desc = "[G]et [I]mplementations" })

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
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action,
          { buffer = bufnr, remap = false, desc = "Display available code actions" })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = "Rename symbol" })
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
          { buffer = bufnr, remap = false, desc = "Signature help" })

        -- lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

      require("lspconfig").rust_analyzer.setup({
        cargo = {
          sysroot_query_metadata = true
        }
      })

      require("lspconfig").tsserver.setup({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", },
      })

      lsp.setup()
    end
  },
}
