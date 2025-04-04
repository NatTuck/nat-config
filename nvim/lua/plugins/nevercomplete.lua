return {
  {
    "hrsh7th/nvim-cmp",
    completion = { autocomplete = false },
    opts = {},
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        trigger = {
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
}
