return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Preserve LazyVim's defaults (e.g., ensure_installed includes heex for Elixir/Phoenix)
      vim.list_extend(opts.ensure_installed, { "heex" })
      return opts
    end,
    config = function()
      -- Hook into TSUpdate to override heex parser source dynamically
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          local parsers = require("nvim-treesitter.parsers")
          parsers.heex = {
            install_info = {
              url = "https://github.com/NatTuck/tree-sitter-heex.git", -- Your fork
              files = { "src/parser.c" },
              branch = "main",
              -- Optional: Pin to your commit for stability, e.g., revision = "abc123..."
            },
            -- Disable upstream to use fork exclusively
            maintainers = {},
            files = {},
          }
        end,
      })
    end,
  },
}
