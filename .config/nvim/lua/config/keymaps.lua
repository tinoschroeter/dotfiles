-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local Terminal = require("toggleterm")

vim.keymap.set("n", "<leader>m", function()
  Util.float_term({ "mfp" })
end, { desc = "Music" })

vim.keymap.set("n", "<leader>h", function()
  Util.float_term({ "tig", vim.api.nvim_buf_get_name(0) })
end, { desc = "tig git tool" })

vim.keymap.set("n", "<leader>d", function()
  Util.float_term({ "lazydocker" })
end, { desc = "lazydocker" })

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

vim.keymap.set(
  "n",
  "<leader>r",
  require("telescope.builtin").oldfiles,
  { noremap = true, silent = true, desc = "previously open files" }
)
