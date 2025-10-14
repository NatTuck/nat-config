-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("v", "<A-j>")

vim.keymap.set("n", "Q", "gwap", { desc = "Reflow paragraph" })

local toggle_diagnostics = function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.disable()
  else
    vim.diagnostic.enable()
  end
end
vim.keymap.set("n", "<leader>ct", toggle_diagnostics, { desc = "Toggle diagnostics" })
