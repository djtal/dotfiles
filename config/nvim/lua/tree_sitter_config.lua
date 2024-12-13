require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "yaml", "ruby", "lua", "bash", "css", 'javascript' },

  endwise = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "yaml", "eruby.yaml", },
  },
  matchup = {
    enable = true,
  },
  embedded_template = { enable = true, },
}
require('nvim-ts-autotag').setup({ filetypes = { "html" , "xml", "eruby", "embedded_template" } })
