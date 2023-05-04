local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = false,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snips/*.lua", true)) do
  loadfile(ft_path)()
end

-- see https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#edit_snippet_files
-- see also https://github.com/L3MON4D3/Dotfiles/blob/89e0d2d0b8285a3368ff2eaa2f537193a371d42c/.config/nvim/lua/plugins/luasnip/ft_edit.lua
-- Need to autoselect filetype
-- use telescope
local edit_snips = function()
  require("luasnip.loaders").edit_snippet_files {
    ft_filter = function(_)
      return false
    end,
    edit = function(file)
      print("edit func")
      vim.cmd('tabnew ' .. file)
    end,
    format = function(file, source_name)
      print(file .. ' ' .. source_name)
      return file
    end,
  }
end

vim.api.nvim_create_user_command("LuaSnipEdit", edit_snips, {})


-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  print "keymap ok"
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })
-- -- <c-j> is my jump backwards key.
-- -- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- -- <c-l> is selecting within a list of options.
-- -- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>w", "<cmd>source ~/.config/nvim/lua/lua_snip.lua<CR>")
