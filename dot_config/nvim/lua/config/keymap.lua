-- This is needed to allow using space as the leader whist in visual mode.
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
-- Stop replace mode in visual mode. This is a workaround for some visual leader issues.
vim.api.nvim_set_keymap('v', 'r', '<Nop>', { noremap = true, silent = true })

-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- LEARNING - Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Close a tab
vim.keymap.set('n', '<A-q>', '<cmd>tabclose<CR>')
-- Close current buffer
vim.keymap.set('n', '<A-w>', '<cmd>:bd<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- half screen up and down zz: center cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-Down>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-Up>', '<C-u>zz')

-- when searching n: go to next result; zz: to center the result/cursor; zv expand all folds
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Indent and keep selection
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Unindent and keep selection
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

-- Always use P instead of p in visual mode. P doesn't mess with registers.
vim.api.nvim_set_keymap('v', 'p', 'P', { noremap = true, silent = true })

-- Git diff
vim.keymap.set('n', '<leader>dd', '<cmd>:DiffviewOpen<cr>', { desc = 'Git [d]iff' })
vim.keymap.set('n', '<leader>do', '<cmd>:DiffviewOpen origin/main...HEAD<cr>', { desc = 'Git [d]iff against [o]rigin/main' })

-- stop ctrl-z from suspending
vim.api.nvim_set_keymap('n', '<c-z>', '<nop>', { noremap = true, silent = true })
