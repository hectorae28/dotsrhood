-- NeoCodeium - Free AI completion plugin
-- URL: https://github.com/monkoose/neocodeium
-- Description: AI-powered code completion using Windsurf (formerly Codeium)

return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup({
      -- Enable completion automatically
      enabled = true,
      -- Show suggestions automatically while typing
      manual = false,
      -- Debounce time for suggestions (milliseconds)
      debounce = 100,
      -- Maximum number of lines to send as context
      max_lines = 10000,
      -- Disable in specific filetypes if needed
      filetypes = {
        -- help = false,
        -- gitcommit = false,
        -- gitrebase = false,
        -- ["."] = false,
      },
    })

    -- Keymaps for accepting suggestions
    vim.keymap.set("i", "<A-f>", function()
      require("neocodeium").accept()
    end, { desc = "Accept NeoCodeium suggestion" })

    vim.keymap.set("i", "<A-w>", function()
      require("neocodeium").accept_word()
    end, { desc = "Accept NeoCodeium word" })

    vim.keymap.set("i", "<A-l>", function()
      require("neocodeium").accept_line()
    end, { desc = "Accept NeoCodeium line" })

    vim.keymap.set("i", "<A-]>", function()
      require("neocodeium").cycle_or_complete()
    end, { desc = "Cycle NeoCodeium suggestions" })

    vim.keymap.set("i", "<A-[>", function()
      require("neocodeium").cycle_or_complete(-1)
    end, { desc = "Cycle NeoCodeium suggestions (backwards)" })

    vim.keymap.set("i", "<A-c>", function()
      require("neocodeium").clear()
    end, { desc = "Clear NeoCodeium suggestion" })
  end,
}
