return {
  "xiyaowong/nvim-transparent",
  opts = {
    groups = { -- table: default groups
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier', 'Statement', 'PreProc', 'Type', 'Underlined',
      'Todo', 'String', 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText', 'SigColumn',
      'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'TelescopeNormal', 'TelescopeBorder', 'NvimTreeNormal',
      "EndOfBuffer", "FloatBorder"
    },
    extra_groups = {},   -- table: additional groups that should be cleared
    exclude_groups = {}, -- table: groups you don't want to clear
  }
}
