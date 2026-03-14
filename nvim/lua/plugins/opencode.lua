return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("opencode").toggle()
      end,
      mode = { "n" },
      desc = "Toggle OpenCode", -- Abre/cierra el panel de OpenCode
    },
    {
      "<leader>as",
      function()
        require("opencode").select({ submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode select", -- Envía el texto seleccionado a OpenCode
    },
    {
      "<leader>ai",
      function()
        require("opencode").ask("", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode ask", -- Abre un prompt para preguntar a OpenCode
    },
    {
      "<leader>aI",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode ask with context", -- Pregunta con el contexto del código actual
    },
    {
      "<leader>ab",
      function()
        require("opencode").ask("@file ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode ask about buffer", -- Pregunta sobre el archivo actual
    },
    {
      "<leader>ap",
      function()
        require("opencode").prompt("@this", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode prompt", -- Abre el menú de prompts integrados
    },
    -- Built-in prompts
    {
      "<leader>ape",
      function()
        require("opencode").prompt("explain", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode explain", -- Explica el código seleccionado
    },
    {
      "<leader>apf",
      function()
        require("opencode").prompt("fix", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode fix", -- Propone una solución al problema
    },
    {
      "<leader>apd",
      function()
        require("opencode").prompt("diagnose", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode diagnose", -- Diagnostica errores o problemas
    },
    {
      "<leader>apr",
      function()
        require("opencode").prompt("review", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode review", -- Revisa y analiza el código
    },
    {
      "<leader>apt",
      function()
        require("opencode").prompt("test", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode test", -- Genera tests para el código
    },
    {
      "<leader>apo",
      function()
        require("opencode").prompt("optimize", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "OpenCode optimize", -- Propone optimizaciones de código
    },
  },
  config = function()
    vim.g.opencode_opts = {
      provider = {
        snacks = {
          win = {
            position = "left",
          },
        },
      },
    }
    vim.o.autoread = true
  end,
}
