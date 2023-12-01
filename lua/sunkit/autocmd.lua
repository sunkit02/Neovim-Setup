local vim = vim
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.api.nvim_create_autocmd({"BufWrite", "BufWritePre"}, {
  pattern = {"*.rs"},
  callback = function() vim.lsp.buf.format() end,
})


-- local auto_format_group = vim.api.nvim_create_augroup("AutoFormat", { clear = true })
-- vim.api.nvim_create_autocmd("FormatOnSave", {
--     callback = function ()
--         vim.lsp.buff.format()
--     end,
--     group = auto_format_group,
--     pattern = "",
-- })
