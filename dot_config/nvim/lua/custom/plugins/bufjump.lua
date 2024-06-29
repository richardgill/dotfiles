return {
  'kwkarlwang/bufjump.nvim',
  version = '*',
  config = function()
    require('bufjump').setup {
      forward_key = '<C-S-Tab>',
      backward_key = '<C-Tab>',
      on_success = nil,
    }
  end,
}
