local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	-- 'sumneko_lua',
	'rust_analyzer'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	-- ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	-- ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select  = true }),
	['<CR>'] = cmp.mapping.confirm({ select  = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

--variable rename
-- vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

lsp.set_preferences({
	sign_icons = { }
})

lsp.on_attach(function (_, bufnr)
	local opts = {buffer = bufnr, remap = false, desc = "Keymaps for LSP"}

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    -- vim.keymap.set('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
end)

lsp.setup()
