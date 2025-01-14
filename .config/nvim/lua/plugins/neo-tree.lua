return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  fuzzy_finder_mappings = {
    -- define keymaps for filter pop-up window in fuzzy_finder_mode
    ["<down>"] = "move_cursor_down",
    ["<C-n>"] = "move_cursor_down",
    ["<up>"] = "move_cursor_up",
    ["<C-p>"] = "move_cursor_up",
  },
}
