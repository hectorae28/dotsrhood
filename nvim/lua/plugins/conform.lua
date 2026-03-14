return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome", "prettier" },
        javascriptreact = { "biome", "prettier" },
        typescript = { "biome", "prettier" },
        typescriptreact = { "biome", "prettier" },
        json = { "biome", "prettier" },
        jsonc = { "biome", "prettier" },
        html = { "prettier" },
        css = { "biome", "prettier" },
        scss = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        go = { "goimports", "gofumpt" },
      },
    },
  },
}
