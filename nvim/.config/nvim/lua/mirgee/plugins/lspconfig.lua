return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "ray-x/lsp_signature.nvim" },
  },
  config = function()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      update_in_insert = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local telescope = require("telescope.builtin")
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
        map("gi", telescope.lsp_implementations, "[G]oto [I]mplementation")
        map("gr", telescope.lsp_references, "[G]oto [R]eferences")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
        map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
        map("<leader>r", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>a", function()
          vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
        end, "[C]ode [A]ction")
        map("<space>e", vim.diagnostic.open_float, "Open float")
        map("[d", vim.diagnostic.goto_prev, "Goto next diagnostic")
        map("]d", vim.diagnostic.goto_next, "Goto previous diagnostic")
        map("<space>f", vim.lsp.buf.format, "Format")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
  end,
}
