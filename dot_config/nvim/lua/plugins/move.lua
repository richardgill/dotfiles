return {
  'fedepujol/move.nvim',
  version = '*',
  config = function()
    require('move').setup {
      line = {
        enable = true, -- Enables line movement
        indent = true, -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true, -- Toggles indentation
      },
    }
    local opts = { noremap = true, silent = true }
    -- Normal-mode commands
    vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
    vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', opts)
    vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
    vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)

    -- Visual-mode commands
    vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
    vim.keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)
    vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
    vim.keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
  end,
}
