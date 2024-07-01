return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    require('typescript-tools').setup {
      settings = {
        complete_function_calls = true,
        include_completions_with_insert_text = true,
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    }
  end,
}
