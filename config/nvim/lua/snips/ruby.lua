local ls = require "luasnip"


ls.add_snippets("ruby", {
  ls.parser.parse_snippet("frozen", "# frozen_string_literal: true\n\n$0"),
  ls.parser.parse_snippet("module", "module $1\n  $0\nend"),
  ls.parser.parse_snippet("class", "class $1\n  $0\nend"),
  ls.parser.parse_snippet("inc", "include $1"),
  ls.parser.parse_snippet("pry", "binding.pry"),
  ls.parser.parse_snippet("log", "Rails.logger.debug $1"),

  -- rspec specifics
  ls.parser.parse_snippet("rdes", "RSpec.describe $1 do\n  $0\nend"),
  ls.parser.parse_snippet("it", "it '$1' do\n  $0\nend\n"),
  ls.parser.parse_snippet("rex", "expect($1).to $2"),
  ls.parser.parse_snippet("fac", "FactoryBot.define do\n  factory :$1 do\n$0\n  end\nend"),

  ls.parser.parse_snippet("spp", "class $1 < SitePrism::Page\n  set_url $2\n$0\nend"),
})

ls.add_snippets("eruby", {
  ls.parser.parse_snippet("<=", "<%= $0 %>"),
  ls.parser.parse_snippet("<", "<% $0 %>"),
})

