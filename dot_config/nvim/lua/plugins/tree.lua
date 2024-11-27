return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup {
      create_in_closed_folder = false,
      respect_buf_cwd = true,
      actions = {
        open_file = {
          resize_window = true,
          window_picker = {
            enable = false,
          },
        },
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 400,
      },
      view = {
        float = {
          enable = true,
          open_win_config = function()
            local height = math.max(vim.o.lines - 3, 20)

            return {
              relative = 'win',
              border = 'rounded',
              width = 50,
              height = height,
              row = 0,
              col = 0,
            }
          end,
        },
      },
      hijack_directories = {
        auto_open = false,
      },
      hijack_unnamed_buffer_when_opening = true,
      update_focused_file = {
        enable = true,
      },
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        local function edit_or_open()
          local node = api.tree.get_node_under_cursor()

          if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
          else
            -- open file
            api.node.open.edit()
            -- Close the tree if file was opened
            api.tree.close()
          end
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
        vim.keymap.set('n', '<space>', edit_or_open, opts 'Edit or open')
        vim.keymap.set('n', '<esc>', api.tree.close, opts 'Close')
      end,
      renderer = {
        add_trailing = false,
        highlight_opened_files = 'all',
        root_folder_modifier = ':~',
        group_empty = false,
        special_files = { 'README.md' },
        icons = {
          padding = ' ',
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = '',
            symlink = '',
            folder = {
              arrow_closed = '',
              arrow_open = '',
              default = '',
              open = '',
              empty = '',
              empty_open = '',
              symlink = '',
              symlink_open = '',
            },
            git = {
              unstaged = '✗',
              staged = '✓',
              unmerged = '',
              renamed = '➜',
              untracked = '★',
              deleted = '',
              ignored = '◌',
            },
          },
        },
        indent_markers = {
          enable = true,
        },
      },
    }

    -- set keymaps
    vim.keymap.set('n', '\\', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
  end,
}
