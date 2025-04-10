return {
  {
    "saghen/blink.cmp",
    enabled = true,
    opts = {
      completion = {
        trigger = {
          -- TODO: Figure out the rest.
          show_on_keyword = false,
          show_on_trigger_character = false,
        },
        menu = {
          auto_show = false,
        },
      },
    },
    sources = {
      default = { "lsp" },
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    enabled = false,
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = false,
  },

  -- These probably aren't even installed.
  {
    "hrsh7th/cmp-buffer",
    enabled = false,
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    opts = function(_, opts)
      opts.comp = { autocomplete = false }
    end,
  },
}
