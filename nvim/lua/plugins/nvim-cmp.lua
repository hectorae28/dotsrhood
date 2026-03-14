return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- ✨ Autocompletado básico
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    -- ✨ Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- 🤖 Codeium (IA)
    {
      "Exafunction/codeium.nvim",
      cmd = "Codeium",
      build = ":Codeium Auth",
      opts = {},
    },
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Cargar snippets de VSCode y los tuyos propios
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "codeium", group_index = 1, priority = 100 },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind_icons = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            Constant = "󰏿",
            Struct = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
          }

          vim_item.kind = string.format("%s", kind_icons[vim_item.kind] or "")
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
            codeium = "[AI]",
          })[entry.source.name]
          return vim_item
        end,
      },
    })

    -- Autocompletado para comandos (":")
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    })
  end,
}
