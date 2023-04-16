local vim = vim
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	-- 'sumneko_lua',
	'rust_analyzer',
})

-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	-- ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
-- 	-- ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
-- 	['<C-y>'] = cmp.mapping.confirm({ select  = true }),
-- 	['<CR>'] = cmp.mapping.confirm({ select  = true }),
-- 	['<C-Space>'] = cmp.mapping.complete(),
-- })

local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
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
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

lsp.set_preferences({
	sign_icons = { }
})


lsp.on_attach(function (client, bufnr)
    -- Disabling LSP syntax highlighting when in conflict with treesitter
    client.server_capabilities.semanticTokensProvider = nil

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr, remap = false, desc = "[G]o to [D]efinition"})
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = bufnr, remap = false, desc = "[G]o to [D]eclaration"})
	vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = bufnr, remap = false, desc = "[G]et [R]eferences"})
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = bufnr, remap = false, desc = "[G]et [T]ype Definition"})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = bufnr, remap = false, desc = "[G]et [I]mplementations"})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr, remap = false, desc = "Hover over current symbol"})
	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, {buffer = bufnr, remap = false, desc = "Workspace symbols"})
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {buffer = bufnr, remap = false, desc = "Open diagnostics floating window"})
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {buffer = bufnr, remap = false, desc = "Next diagnostic"})
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {buffer = bufnr, remap = false, desc = "Previous diagnostic"})
	vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {buffer = bufnr, remap = false, desc = "Display available code actions"})
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = bufnr, remap = false, desc = "Rename symbol"})
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {buffer = bufnr, remap = false, desc = "Signature help"})
end)

-- Configure omnisharp for Unity developemnt
-- local nvim_lsp = require('lspconfig')
--
-- local pid = vim.fn.getpid()
-- -- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- local omnisharp_bin = "/home/sunkit/.local/share/nvim/mason/packages/omnisharp/omnisharp"
--
-- nvim_lsp.omnisharp.setup({
-- cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
--     root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln");
--     ...
-- })


lsp.setup()
