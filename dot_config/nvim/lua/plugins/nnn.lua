return {
  'luukvbaal/nnn.nvim',
  version = '*',
  config = function()
    require('nnn').setup {
      explorer = {
        cmd = 'nnn', -- command override (-F1 flag is implied, -a flag is invalid!)
        width = 24, -- width of the vertical split
        side = 'topleft', -- or "botright", location of the explorer window
        session = '', -- or "global" / "local" / "shared"
        tabs = false, -- separate nnn instance per tab
        fullscreen = true, -- whether to fullscreen explorer window when current tab is empty
      },
      picker = {
        cmd = 'nnn', -- command override (-p flag is implied)
        style = {
          width = 0.9, -- percentage relative to terminal size when < 1, absolute otherwise
          height = 0.8, -- ^
          xoffset = 0.5, -- ^
          yoffset = 0.5, -- ^
          border = 'single', -- border decoration for example "rounded"(:h nvim_open_win)
        },
        session = 'global', -- or "global" / "local" / "shared"
        tabs = false, -- separate nnn instance per tab
        fullscreen = true, -- whether to fullscreen picker window when current tab is empty
      },
      auto_close = true, -- close tabpage/nvim when nnn is last window
    }
  end,
}
