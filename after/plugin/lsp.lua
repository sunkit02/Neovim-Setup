local vim = vim
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  -- 'sumneko_lua',
  'rust_analyzer',
})


local cmp = require("cmp")
local luasnip = require("luasnip")

local function super_tab()
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end

local function expand_luasnip()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end

vim.keymap.set("i", "<Tab>", super_tab, { noremap = true, silent = true, desc = "Super tab" })
vim.keymap.set("i", "<A-c>", expand_luasnip, { noremap = true, silent = true, desc = "Expand or jump luasnip" })

luasnip.config.setup {}

cmp.setup {
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
    -- documentation = cmp.config.window.bordered(),
  },
}

lsp.set_preferences({
  sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
  -- Disabling LSP syntax highlighting when in conflict with treesitter
  client.server_capabilities.semanticTokensProvider = bufnr

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, remap = false, desc = "[G]o to [D]efinition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, remap = false, desc = "[G]o to [D]eclaration" })
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
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, remap = false, desc = "Previous diagnostic" })
  vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action,
    { buffer = bufnr, remap = false, desc = "Display available code actions" })
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = "Rename symbol" })
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = bufnr, remap = false, desc = "Signature help" })
end)


-- -- Configure omnisharp for Unity developemnt
-- local nvim_lsp = require('lspconfig')
-- --
-- local pid = vim.fn.getpid()
-- -- -- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- local omnisharp_bin = "/home/sunkit/.local/share/nvim/mason/packages/omnisharp/omnisharp"
-- local omnisharp_dll = "/home/sunkit/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll"
-- --
-- nvim_lsp.omnisharp.setup({
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
--     -- cmd = { "dotnet", omnisharp_dll };
--     -- root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln");
--     --
--     --
--     -- Enables support for reading code style, naming convention and analyzer
--     -- settings from .editorconfig.
--     enable_editorconfig_support = true,
--
--     -- If true, MSBuild project system will only load projects for files that
--     -- were opened in the editor. This setting is useful for big C# codebases
--     -- and allows for faster initialization of code navigation features only
--     -- for projects that are relevant to code that is being edited. With this
--     -- setting enabled OmniSharp may load fewer projects and may thus display
--     -- incomplete reference lists for symbols.
--     enable_ms_build_load_projects_on_demand = false,
--
--     -- Enables support for roslyn analyzers, code fixes and rulesets.
--     enable_roslyn_analyzers = false,
--
--     -- Specifies whether 'using' directives should be grouped and sorted during
--     -- document formatting.
--     organize_imports_on_format = false,
--
--     -- Enables support for showing unimported types and unimported extension
--     -- methods in completion lists. When committed, the appropriate using
--     -- directive will be added at the top of the current file. This option can
--     -- have a negative impact on initial completion responsiveness,
--     -- particularly for the first few completion sessions after opening a
--     -- solution.
--     enable_import_completion = false,
--
--     -- Specifies whether to include preview versions of the .NET SDK when
--     -- determining which version to use for project loading.
--     sdk_include_prereleases = true,
--
--     -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--     -- true
--     analyze_open_documents_only = false,
-- })


lsp.setup()
