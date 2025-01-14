-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.mouse = "" -- Disable mouse mode
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.spelllang = { "en", "de" } -- enable spelling
vim.opt.spell = false
vim.opt.conceallevel = 3
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true -- Enable highlighting of the current line

-- Centering with scrolloff (scroll offset)
vim.opt.so = 99

-- misc
vim.opt.undofile = true
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.laststatus = 3

-- Snacks animations
vim.g.snacks_animate = true
