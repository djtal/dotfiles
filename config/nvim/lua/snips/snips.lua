local ls = require "luasnip"


ls.add_snippets("ruby", {
  ls.parser.parse_snippet("frozen", "# frozen_string_literal: true")
})

