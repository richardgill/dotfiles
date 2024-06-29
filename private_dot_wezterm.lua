-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
-- and finally, return the configuration to wezterm
return {
    use_fancy_tab_bar = false,
    show_tabs_in_tab_bar = false,
    show_new_tab_button_in_tab_bar = false,
    colors = theme.colors(),
    keys = {
      {
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
      },
      -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
      {
        key="LeftArrow",
        mods="OPT",
        action=wezterm.action{SendString="\x1bb"}
      },
      -- Make Option-Right equivalent to Alt-f; forward-word
      {
        key="RightArrow",
        mods="OPT",
        action=wezterm.action{SendString="\x1bf"}
      },
      {
        key = 'LeftArrow',
        mods = 'CMD',
        action = wezterm.action { SendString = "\x1bOH" },
      },
      {
        key = 'RightArrow',
        mods = 'CMD',
        action = wezterm.action { SendString = "\x1bOF" },
      },
      {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
      },
    },
    window_padding = {
      left = 12,
      right = 12,
      top = 0,
      bottom = 2,
    },
    window_decorations = "RESIZE"
}
