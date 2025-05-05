vim.api.nvim_create_autocmd('User', {
  pattern = 'DiffviewViewLeave',
  callback = function()
    --stops annoying diff view opening when git changes are made on command line
    vim.cmd ':DiffviewClose'
  end,
})

return {
  'sindrets/diffview.nvim',
  version = '*',
  config = function()
    require('diffview').setup {
      default_args = {
        DiffviewOpen = { '--imply-local' },
      },
    }
  end,
}
