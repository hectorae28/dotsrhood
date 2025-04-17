-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 1

--- save notification ---
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    local filename = vim.fn.expand("%:t")
    local filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
    vim.notify("Saved!! " .. filepath .. "/" .. filename, vim.log.levels.INFO, {
      title = "Guardar archivo",
      timeout = 2000, -- tiempo de duración de la notificación en milisegundos
    })
  end,
})
