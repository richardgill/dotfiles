return {
  'mg979/vim-visual-multi',
  -- See https://github.com/mg979/vim-visual-multi/issues/241
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ['Find Under'] = '',
    }
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,
  config = function()
    vim.keymap.set('n', '<leader>mu', '<Plug>(VM-Find-Under)', { desc = 'Multi cursor [U]nder' })
    vim.keymap.set('v', '<leader>mu', '<Plug>(VM-Find-Subword-Under)', { desc = 'Multi cursor [U]nder' })
    vim.keymap.set('n', '<leader>ma', '<Plug>(VM-Select-All)', { desc = 'Multi cursor [S]elect [A]ll' })
    vim.keymap.set('n', '<leader>mp', '<Plug>(VM-Add-Cursor-At-Pos)', { desc = 'Multi cursor add cursor at [P]osition' })
    vim.keymap.set('n', '<leader>mt', '<Plug>(VM-Toggle-Mappings)', { desc = 'Multi cursor [T]oggle' })
    vim.keymap.set('n', '<leader>mr', '<Plug>(VM-Start-Regex-Search)', { desc = 'Multi cursor [R]egex search' })
  end,
}
