return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      shade_terminals = true,
      shading_factor = 3.9,
      hide_numbers = true,
      border = "shadow",
      shell = "zsh --login",
    })
  end,
  keys = {
    { [[<C-\>]] },
    { "<leader>t", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal" },
  },
}
