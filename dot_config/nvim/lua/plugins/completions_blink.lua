return {
  'saghen/blink.cmp',

  -- use a release tag to download pre-built binaries
  version = '1.*',
  config = function()
    require('blink.cmp').setup {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = 'enter' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        nerd_font_variant = 'mono',
      },

      snippets = { preset = 'default' },
      -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- experimental signature help support
      signature = { enabled = false },
    }
  end,
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { 'sources.default' },
}
