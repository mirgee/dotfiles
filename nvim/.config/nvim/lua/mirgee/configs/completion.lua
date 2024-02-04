local cmp = require "cmp"

cmp.setup {
  sources = cmp.config.sources({
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "copilot" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  }),

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
}
