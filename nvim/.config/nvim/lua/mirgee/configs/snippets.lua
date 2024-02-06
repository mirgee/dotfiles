local ls = require "luasnip"

local types = require "luasnip.util.types"

ls.config.set_config {
  history = false,

  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-S>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- To load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- TODO: Autoload those
require "mirgee.snippets.rust"
