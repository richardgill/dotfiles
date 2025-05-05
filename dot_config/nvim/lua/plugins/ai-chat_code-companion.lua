return {
  'olimorris/codecompanion.nvim',
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'anthropic',
        },
        inline = {
          adapter = 'anthropic',
          keymaps = {
            accept_change = {
              modes = { n = 'C-l' },
              description = 'Accept the suggested change',
            },
          },
        },
        cmd = {
          adapter = 'anthropic',
        },
      },
    }
    vim.keymap.set('n', '<leader>aa', '<cmd>CodeCompanionChat<CR>', {
      desc = 'Chat',
      silent = true,
    })
    vim.keymap.set('v', '<leader>aa', '<cmd>CodeCompanionChat<CR>', {
      desc = 'Chat',
      silent = true,
    })

    vim.keymap.set('n', '<leader>ae', '<cmd>CodeCompanion<CR>', {
      desc = 'Edit Inline',
      silent = true,
    })
    vim.keymap.set('v', '<leader>ae', '<cmd>CodeCompanion<CR>', {
      desc = 'Edit Inline',
      silent = true,
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
