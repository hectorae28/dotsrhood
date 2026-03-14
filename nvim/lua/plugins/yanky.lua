return {
  "gbprod/yanky.nvim",
  keys = {
    -- En modo visual, pegar sin guardar el texto eliminado en el registro
    { "p", '"_d<Plug>(YankyPutBefore)', mode = { "x" }, desc = "Put Text (no overwrite register)" },
  },
}
