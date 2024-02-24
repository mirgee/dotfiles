local lspconfig = require("lspconfig")

local rt = require("rust-tools")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

rt.setup({
  server = {
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          tests = true,
        },
        completion = {
          postfix = {
            enable = false,
          },
        },
        server = {
          extraEnv = {},
        },
      },
    },
    capabilities = capabilities,
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})

lspconfig.vimls.setup({})

lspconfig.pylsp.setup({})

lspconfig.elixirls.setup({})

lspconfig.eslint.setup({})

lspconfig.tsserver.setup({})

lspconfig.terraformls.setup({})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
          "describe",
          "it",
          "assert",
          "before_each",
          "after_each",
          "pending",
        },
      },
    },
  },
})

lspconfig.solc.setup({
  root_dir = lspconfig.util.root_pattern("hardhat.config.*", ".git"),
})

lspconfig.solidity.setup({
  capabilities = capabilities,
  -- settings = {
  --   -- example of global remapping
  --   solidity = { includePath = '', remapping = { ["@OpenZeppelin/"] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/' } }
  -- },
})

lspconfig.emmet_language_server.setup({
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
  },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})
