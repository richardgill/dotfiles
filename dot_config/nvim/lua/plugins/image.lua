return {
  {
    '3rd/image.nvim',
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    config = function()
      require('image').setup {
        backend = 'kitty',
        kitty_method = 'normal',
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            floating_windows = false, -- if true, images will be rendered in floating markdown windows
            filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
          },
        },
        processor = 'magick_cli', -- or "magick_cli"
        window_overlap_clear_enabled = true,
        editor_only_render_when_focused = true,
        tmux_show_only_in_active_window = true,
      }
    end,
  },
}
