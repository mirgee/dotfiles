local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

require("rust-tools").setup({
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

lspconfig.vimls.setup({})

lspconfig.pylsp.setup({})

lspconfig.elixirls.setup({})

lspconfig.eslint.setup({})

lspconfig.tsserver.setup({})

lspconfig.terraformls.setup({})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "~/.local/share/nvim/lazy/plenary.nvim/lua",
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

-- require 'lspconfig'.solidity_ls.setup {}

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

lspconfig.jdtls.setup {
  cmd = { "jdtls", "-configuration", "~/.cache/jdtls/config", "-data", "~/.cache/jdtls/workspace" },
  filetypes = { "java" },
  init_options = {
    jvm_args = {},
    workspace = "/home/user/.cache/jdtls/workspace",
    root_dir = {
      -- Single-module projects
      {
        'build.xml',           -- Ant
        'pom.xml',             -- Maven
        'settings.gradle',     -- Gradle
        'settings.gradle.kts', -- Gradle
      },
      -- Multi-module projects
      { 'build.gradle', 'build.gradle.kts' },
    } or vim.fn.getcwd()
  },
  single_file_support = true
}

lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
