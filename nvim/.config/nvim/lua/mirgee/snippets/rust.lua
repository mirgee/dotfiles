local same = function(index)
  local ls = require("luasnip")
  return ls.function_node(function(args)
    return args[1]
  end, { index })
end

return {
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
          t(""),
          t(" -> Result<()> "),
          -- fmt(" -> {}<()> ", { i(nil, "Result") }),
        }),
        i(0),
      }
    )
  ),

  s("dbg", fmt([[dbg!("{}: {{:?}}", {});]], { same(1), i(1) })),

  s("tostr", fmt([[serde_json::to_string(&{})?]], i(0))),
}
