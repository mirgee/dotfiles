return {
  "hrsh7th/nvim-cmp",
  branch = "main",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp", branch = "main" },
    { "hrsh7th/cmp-nvim-lua", branch = "main" },
    { "hrsh7th/cmp-buffer", branch = "main" },
    { "hrsh7th/cmp-path", branch = "main" },
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
    },
    { "saadparwaiz1/cmp_luasnip" },
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      completion = { completeopt = "menu,menuone,noinsert" },

      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert, "i", "c" }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert, "i", "c" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        -- ["<C-e>"] = cmp.mapping.abort(),

        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { "i", "c" }
        ),

        ["<M-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          { "i", "c" }
        ),

        ["<C-space>"] = cmp.mapping({
          i = cmp.mapping.complete(),
          c = function(
            _ --[[fallback]]
          )
            if cmp.visible() then
              if not cmp.confirm({ select = true }) then
                return
              end
            else
              cmp.complete()
            end
          end,
        }),
      },

      sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
      }),

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })
  end,
}
