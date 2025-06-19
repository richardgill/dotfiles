return {
  'dlants/magenta.nvim',
  lazy = false, -- you could also bind to <leader>at
  build = 'npm install --frozen-lockfile',
  config = function()
    require('magenta').setup {
      profiles = {
        {
          name = 'claude-sonnet-3.7',
          provider = 'anthropic',
          model = 'claude-3-7-sonnet-latest',
          apiKeyEnvVar = 'ANTHROPIC_API_KEY',
        },
        {
          name = 'claude-sonnet-4',
          provider = 'anthropic',
          model = 'claude-sonnet-4-20250514',
          apiKeyEnvVar = 'ANTHROPIC_API_KEY',
        },
        {
          name = 'claude-opus-4',
          provider = 'anthropic',
          model = 'claude-opus-4-20250514',
          apiKeyEnvVar = 'ANTHROPIC_API_KEY',
        },
        {
          name = 'gpt-4o',
          provider = 'openai',
          model = 'gpt-4o',
          apiKeyEnvVar = 'OPENAI_API_KEY',
        },
      },
      -- open chat sidebar on left or right side
      sidebarPosition = 'right',
      picker = 'telescope',
      defaultKeymaps = true,

      sidebarKeymaps = {
        normal = {
          ['<CR>'] = ':Magenta send<CR>',
        },
      },
      -- keymaps for the inline edit input buffer
      -- if keymap is set to function, it accepts a target_bufnr param
      inlineKeymaps = {
        normal = {
          ['<CR>'] = function(target_bufnr)
            vim.cmd('Magenta submit-inline-edit ' .. target_bufnr)
          end,
        },
      },
    }

    local Actions = require 'magenta.actions'

    vim.keymap.set('n', '<leader>aa', ':Magenta new-thread<CR>', { silent = true, noremap = true, desc = 'Create new Magenta thread' })

    vim.keymap.set('n', '<leader>ac', ':Magenta clear<CR>', { silent = true, noremap = true, desc = 'Clear Magenta state' })

    vim.keymap.set('n', '<leader>aq', ':Magenta abort<CR>', { silent = true, noremap = true, desc = 'Abort current Magenta operation' })

    vim.keymap.set('n', '<leader>at', ':Magenta toggle<CR>', { silent = true, noremap = true, desc = 'Toggle Magenta window' })

    vim.keymap.set('n', '<leader>ae', ':Magenta start-inline-edit<CR>', { silent = true, noremap = true, desc = 'Inline edit' })

    vim.keymap.set('v', '<leader>ae', ':Magenta start-inline-edit-selection<CR>', { silent = true, noremap = true, desc = 'Inline edit selection' })

    vim.keymap.set('v', '<leader>ap', ':Magenta paste-selection<CR>', { silent = true, noremap = true, desc = 'Send selection to Magenta' })

    vim.keymap.set(
      'n',
      '<leader>ab', -- like "magenta buffer"?
      Actions.add_buffer_to_context,
      { noremap = true, silent = true, desc = 'Add current buffer to Magenta context' }
    )

    vim.keymap.set('n', '<leader>af', Actions.pick_context_files, { noremap = true, silent = true, desc = 'Select files to add to Magenta context' })

    vim.keymap.set('n', '<leader>mp', Actions.pick_profile, { silent = true, noremap = true, desc = 'Select profile' })
  end,
}
