-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- local auto_format_group = vim.api.nvim_create_augroup("AutoFormat", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufWrite", "BufWritePre" }, {
--   callback = function() vim.lsp.buf.format() end,
--   group = auto_format_group,
--   pattern = { "*.rs", "*.go", "*.c", "*.h", "*.cpp", "*.lua" },
-- })


-- local auto_format_group = vim.api.nvim_create_augroup("AutoFormat", { clear = true })
-- vim.api.nvim_create_autocmd("FormatOnSave", {
--     callback = function ()
--         vim.lsp.buff.format()
--     end,
--     group = auto_format_group,
--     pattern = "",
-- })

local auto_change_indent_group = vim.api.nvim_create_augroup("AutoChangeIndent", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 1
  end,
  group = auto_change_indent_group,
  pattern = { "*.html", "*.css" }

})
