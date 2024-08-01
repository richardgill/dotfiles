return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
    config = function()
      require('spectre').setup {
        is_insert_mode = true,
        is_close = true,
        -- is_block_ui_break = true,
        highlight = {
          ui = 'String',
          search = 'DiffDelete',
          replace = 'DiffAdd',
        },
      }
      vim.keymap.set('n', '<leader>rr', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = 'Replace',
      })
      vim.keymap.set('n', '<leader>rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = '[R]eplace current [W]ord',
      })
      vim.keymap.set('v', '<leader>rw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = '[R]eplace current [W]ord',
      })
      vim.keymap.set('n', '<leader>rf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = '[R]eplace in current [F]ile',
      })
      vim.keymap.set('v', '<leader>rf', '<esc><cmd>lua require("spectre").open_file_search()<CR>', {
        desc = '[R]eplace current word in [F]ile',
      })
    end,
  },
}
