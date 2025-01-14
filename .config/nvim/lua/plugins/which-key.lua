return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    preset = "classic",
    spelling = {
      -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      enabled = true,
      -- how many suggestions should be shown in the list?
      suggestions = 20,
    },
  },
}
