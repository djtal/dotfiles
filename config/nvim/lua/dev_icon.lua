require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    ruby = {
      icon = "",
      name= "rb"
    },
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  override_by_extension = {
    ["rb"] = {
      icon = "",
      name= "rb",
      color = "#e67d8f"
    }
  }
}
