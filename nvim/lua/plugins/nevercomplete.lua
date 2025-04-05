return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        autocomplete = false,
      },
    },
  },
  {
    "saghen/blink.cmp",
    enabled = false,
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
    "hrsh7th/cmp-buffer",
    enabled = false,
  },
}
