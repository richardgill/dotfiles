-- Open telescope when entering nvim
local ts_group = vim.api.nvim_create_augroup('TelescopeOnEnter', { clear = true })
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if IS_OPENED_TO_DIR then
      -- close the open buffer
      vim.cmd ':bd 1'
      require('telescope.builtin').find_files()
    end
  end,
  group = ts_group,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
