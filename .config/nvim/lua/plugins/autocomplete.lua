return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  -- dependencies = "rafamadriz/friendly-snippets",

  -- use a release tag to download pre-built binaries
  version = "*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config

  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
      ghost_text = {
        enabled = false,
      },
    },
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },

      ["Up"] = { "snippet_forward", "fallback" },
      ["Down"] = { "snippet_backward", "fallback" },
      ["C-p"] = { "snippet_forward", "fallback" },
      ["C-n"] = { "snippet_backward", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "normal",
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },

  opts_extend = { "sources.default" },
}
