-- Autoformatting
return {
  'stevearc/conform.nvim',
  lazy = false,
  config = function()
    local prettier = { 'prettierd', 'prettier', stop_after_first = true }
    require('conform').setup {
      notify_on_error = false,
      format_on_save = function()
        return {
          timeout_ms = 700,
          lsp_fallback = true,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        typescript = prettier,
        typescriptreact = prettier,
        javascriptreact = prettier,
        mdx = {},
        markdown = {},
        -- fallback to prettier
        -- ['_'] = prettier,
      },
    }

    vim.keymap.set('', '<leader>cf', function()
      require('conform').format { async = true, lsp_fallback = true }
    end, { desc = '[F]ormat buffer' })

    -- FocusLost event to run format first and then save all buffers
    vim.api.nvim_create_autocmd('FocusLost', {
      callback = function()
        -- Format using conform with async and lsp_fallback
        require('conform').format { lsp_fallback = true }

        -- Save all open buffers
        vim.cmd 'silent! wall'
      end,
    })
  end,
}
