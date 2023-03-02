local navic = require("nvim-navic")

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode' },
    lualine_b = {{'filename', symbols = { modified = '🔥', alternate_file = '#'}}},
    lualine_c = {{'branch', icon = ''}, { navic.get_location, cond = navic.is_available }},
    lualine_x = {'filetype'},
    lualine_y = {{'diagnostics', sources = { 'nvim_lsp' }, always_visible = true, symbols = {error = '×', warn = '•', info = '~', hint = '>'}}},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
