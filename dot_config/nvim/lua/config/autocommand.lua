-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Reload the file on focus gained
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermLeave' }, {
  command = 'silent! !',
  group = vim.api.nvim_create_augroup('rg-focus', { clear = true }),
  desc = 'Reload the buffer on focus gained',
})
