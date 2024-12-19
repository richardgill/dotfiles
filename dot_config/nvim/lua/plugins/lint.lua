return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
      }
      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      local function debounce(func, timeout_ms)
        local timer_id = nil
        return function(...)
          local args = { ... }
          if timer_id ~= nil then
            vim.fn.timer_stop(timer_id)
          end
          timer_id = vim.fn.timer_start(timeout_ms, function()
            func(unpack(args))
          end)
        end
      end

      local function lint()
        local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
        local client = get_clients({ bufnr = 0 })[1] or {}
        require('lint').try_lint(nil, {
          -- which folder to lint from
          -- cwd = client.root_dir
        })
      end

      -- Debounced version of your linting function
      local debounced_lint = debounce(lint, 500) -- 500 ms debounce time

      -- Setup the autocmd with debounced lint function
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufReadPost', 'TextChanged', 'TextChangedI' }, {
        group = lint_augroup,
        callback = debounced_lint,
      })
    end,
  },
}
