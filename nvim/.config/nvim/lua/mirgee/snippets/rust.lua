local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node

local ts_utils = require("nvim-treesitter.ts_utils")
local ts_locals = require("nvim-treesitter.locals")

local function get_enclosing_function_nodes()
  local cursor_node = ts_utils.get_node_at_cursor()
  if not cursor_node then
    return {}
  end
  local nodes = {}
  local scope = ts_locals.get_scope_tree(cursor_node, 0)
  for _, node in ipairs(scope) do
    if node:type() == "function_item" then
      table.insert(nodes, node)
    end
  end
  return nodes
end

local function get_function_argument_names_list()
  local args_list = {}
  for _, node in ipairs(get_enclosing_function_nodes()) do
    local parameters = node:field("parameters")[1]
    if parameters then
      for parameter in parameters:iter_children() do
        if parameter:type() == "parameter" then
          local pattern = parameter:field("pattern")[1]
          if pattern then
            local arg_name = vim.treesitter.get_node_text(pattern, 0)
            table.insert(args_list, arg_name)
          end
        end
      end
    end
    break
  end
  return args_list
end

local function get_function_argument_names_string()
  local args_list = get_function_argument_names_list()
  for arg_i = 1, #args_list do
    args_list[arg_i] = string.format("%s = {%s:?}", args_list[arg_i], args_list[arg_i])
  end
  return " " .. table.concat(args_list, ", ")
end

local function get_function_name()
  for _, node in ipairs(get_enclosing_function_nodes()) do
    local name_node = node:field("name")[1]
    if name_node then
      return vim.treesitter.get_node_text(name_node, 0)
    end
    break
  end
  return ""
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

  s("dbg", fmt([[dbg!("{}: {{:?}}", {});]], { rep(1), i(1) })),

  s("tostr", fmt([[serde_json::to_string(&{})?]], i(0))),

  s(
    "print_fn_name",
    fmt([[println!("{} >>>{}");{}]], { f(get_function_name), f(get_function_argument_names_string), i(0) })
  ),
}
