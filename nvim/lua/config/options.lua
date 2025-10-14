-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { { ".projectile", ".git" }, "lsp", { ".git", "lua" }, "cwd" }
vim.g.minipairs_disable = true
vim.g.lazyvim_prettier_needs_config = false
--vim.opt.relativenumber = false
vim.o.autowriteall = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

vim.env.ASDF_TOOL_VERSIONS_FILENAME = ".tools-versions"
