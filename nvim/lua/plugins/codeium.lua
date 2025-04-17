return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
    keys = {
      { "<leader>ac", ":Codeium Chat<cr>", mode = "n", desc = "Codeium - Open Chat" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai" },
        { "gm", group = "+Codeium chat" },
        { "gmh", desc = "Show help" },
        { "gmd", desc = "Show diff" },
        { "gmp", desc = "Show system prompt" },
        { "gms", desc = "Show selection" },
        { "gmy", desc = "Yank diff" },
      },
    },
  },
}
