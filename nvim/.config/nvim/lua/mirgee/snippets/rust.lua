local ls = require "luasnip"
local snippet_collection = require "luasnip.session.snippet_collection"

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

local same = function(index)
  return ls.function_node(function(args)
    return args[1]
  end, { index })
end

-- ls.cl
snippet_collection.clear_snippets "rust"
ls.add_snippets("rust", {
  s(
    "modtest",
    fmt(
      [[
      #[cfg(test)]
      mod test {{
          use super::*;

          {}
      }}
    ]],
      i(0)
    )
  ),

  s(
    { trig = "test" },
    fmt(
      [[
  #[test]
  fn {}(){}{{
    {}
  }}
  ]],
      {
        i(1, "testname"),
        c(2, {
          t "",
          t " -> Result<()> ",
          -- fmt(" -> {}<()> ", { i(nil, "Result") }),
        }),
        i(0),
      }
    )
  ),

  s("dbg", fmt([[dbg!("{}: {{:?}}", {});]], { same(1), i(1) })),

  s(
    "tostr",
    fmt([[serde_json::to_string(&{})?]], i(0))
  ),

})
