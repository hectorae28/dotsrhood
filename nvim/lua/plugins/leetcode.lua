return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- configuration goes here
    lang = "javascript",
  },
  --[[ {
    keys = {
      { "<leader>_r", ":Leet run<cr>", mode = "n", desc = "Leet run curerntly opened question" },
      { "<leader>_s", ":Leet submit<cr>", mode = "n", desc = "Submit currently opened question" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>_", group = "LeetCode" },
        { "gm", group = "+LeetCode" },
        { "gmh", desc = "Show help" },
      },
    },
  }, ]]
}
