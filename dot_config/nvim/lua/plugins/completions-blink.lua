return {}
-- return {
--   'saghen/blink.cmp',
--   -- optional: provides snippets for the snippet source
--   dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
--
--   -- use a release tag to download pre-built binaries
--   version = 'v0.*',
--   config = function()
--     require('blink.cmp').setup {
--       -- 'default' for mappings similar to built-in completion
--       -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
--       -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
--       -- see the "default configuration" section below for full documentation on how to define
--       -- your own keymap.
--       keymap = { preset = 'enter' },
--
--       appearance = {
--         -- Sets the fallback highlight groups to nvim-cmp's highlight groups
--         -- Useful for when your theme doesn't support blink.cmp
--         -- will be removed in a future release
--         use_nvim_cmp_as_default = true,
--         nerd_font_variant = 'mono',
--       },
--       expand = function(snippet)
--         require('luasnip').lsp_expand(snippet)
--       end,
--       active = function(filter)
--         if filter and filter.direction then
--           return require('luasnip').jumpable(filter.direction)
--         end
--         return require('luasnip').in_snippet()
--       end,
--       jump = function(direction)
--         require('luasnip').jump(direction)
--       end,
--       -- default list of enabled providers defined so that you can extend it
--       -- elsewhere in your config, without redefining it, via `opts_extend`
--       sources = {
--         default = { 'lsp', 'path', 'luasnip', 'buffer' },
--         -- cmdline = {},
--       },
--
--       -- experimental signature help support
--       signature = { enabled = false },
--     }
--     local luasnip = require 'luasnip'
--
--     luasnip.config.setup {}
--     local s = luasnip.snippet
--     local i = luasnip.insert_node
--     local t = luasnip.text_node
--     -- Renamed common snippet definition
--     local console_log_zzz_snippet = s('zzz', {
--       t "console.log('zzz ", -- Static text part
--       i(1, ''), -- First insert node with placeholder text 'default1'
--       t "', ", -- Static text part
--       i(2, ''), -- Second insert node with placeholder text 'default2'
--       t ');',
--     })
--     -- Apply the renamed snippet for JavaScript, TypeScript, and their React variants
--     local filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
--
--     for _, ft in ipairs(filetypes) do
--       luasnip.add_snippets(ft, { console_log_zzz_snippet })
--     end
--   end,
--   -- allows extending the providers array elsewhere in your config
--   -- without having to redefine it
--   opts_extend = { 'sources.default' },
-- }