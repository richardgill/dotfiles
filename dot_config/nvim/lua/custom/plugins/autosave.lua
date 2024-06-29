return {
  'pocco81/auto-save.nvim',
  version = '*',
  config = function()
    require('auto-save').setup {
      execution_message = {
        message = function() -- message to print on save
          return ('AutoSave: saved at ' .. vim.fn.strftime '%H:%M:%S')
        end,
        dim = 0.18, -- dim the color of `message`
        cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      },
      trigger_events = { 'BufLeave' },
      -- trigger_events = { 'BufLeave', 'FocusLost' },
      -- condition = function(buf)
      --   local fn = vim.fn
      --   local utils = require 'auto-save.utils.data'
      --
      --   if fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbufvar(buf, '&filetype'), {}) then
      --     return true -- met condition(s), can save
      --   end
      --   return false -- can't save
      -- end,
    }
  end,
}
