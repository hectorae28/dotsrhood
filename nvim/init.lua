-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
-- Hacer que el código "Unused" no se vea gris/comentado
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "Normal" })
-- Detectar automáticamente el entorno virtual (venv) para Pyright
if vim.env.VIRTUAL_ENV then
  require("lspconfig").pyright.setup({
    settings = {
      python = {
        pythonPath = vim.env.VIRTUAL_ENV .. "/bin/python",
      },
    },
  })
end
