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
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            show_result_in_chat = true,
            make_vars = true, -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          },
        },
      },
      display = {
        chat = {
          window = {
            width = 0.30,
          },
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
