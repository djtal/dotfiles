local null_ls = require("null-ls")

-- note that as of july 2023 this plugin is not maintained anymore
-- need to check if other plugin exist to replace
--  * erb_lint
--  * yaml_lint

null_ls.setup({
  on_attach = function(client, bufnr)
    -- Allow formating if supported by client
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,

  sources = {
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.erb_lint,
  },
})
