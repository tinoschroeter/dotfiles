-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>m", function()
  Snacks.terminal.open({ "mfp" })
end, { desc = "Music" })

vim.keymap.set("n", "<leader>t", function()
  Snacks.terminal()
end, { desc = "Terminal" })

vim.keymap.set("n", "<leader>h", function()
  Snacks.terminal.open({ "tig", vim.api.nvim_buf_get_name(0) })
end, { desc = "tig git tool" })

vim.keymap.set("n", "<leader>j", function()
  Snacks.terminal.open({ "jirator" })
end, { desc = "Music" })
