return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        svelte = { { "biome" } },
        javascript = { { "biome" } },
        typescript = { { "biome" } },
        javascriptreact = { { "biome" } },
        typescriptreact = { { "biome" } },
        json = { { "prettierd", "prettier" } },
        graphql = { { "prettierd", "prettier" } },
        java = { "google-java-format" },
        kotlin = { "ktlint" },
        ruby = { "standardrb" },
        markdown = { { "prettierd", "prettier" } },
        erb = { "htmlbeautifier" },
        html = { "htmlbeautifier" },
        bash = { "beautysh" },
        proto = { "buf" },
        -- rust = { "rustfmt" },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        css = { { "biome" } },
        scss = { { "biome" } },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>l", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
