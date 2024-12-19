return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
  config = function()
    require('tokyonight').setup {
      on_colors = function(colors)
        local util = require 'tokyonight.util'
        ---@diagnostic disable-next-line: inject-field
        colors.comment = util.lighten(colors.comment, 0.7)
        ---@diagnostic disable-next-line: inject-field
        colors.bg_visual = util.lighten(colors.bg_visual, 0.8)
        ---@diagnostic disable-next-line: inject-field
        colors.fg_gutter = util.lighten(colors.fg_gutter, 0.7)
      end,
      -- Find highlights by running `:Inspect` with your cursor over an element
      on_highlights = function(hl, colors)
        local util = require 'tokyonight.util'
        -- builtin variables like console
        hl['@variable.builtin'] = { fg = '#7aa2f7' }
        -- unused variables
        hl['DiagnosticUnnecessary'].fg = util.lighten(hl['DiagnosticUnnecessary'].fg, 0.7)
        -- tsx tags <WasRed>
        hl['@tag.tsx'] = { fg = colors.blue1 }
        -- Diff brighter
        hl['DiffAdd'].bg = util.darken('#9ece6a', 0.3)
        hl['DiffDelete'].bg = util.darken(colors.red, 0.5)

        -- highlighting for multi cursor plugin
        hl['MultiCursor'] = hl['IncSearch']
        hl['MultiCursorMain'] = hl['IncSearch']
      end,
    }
  end,
}
