return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = false,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier", stop_first = true },
      typescript = { "prettierd", "prettier", stop_first = true },
      java = { "spotless", stop_first = true },
    },
    formatters = {
      spotless = {
        command = "./gradlew",
        args = { "spotlessApply" },
        stdin = false,
        cwd = function()
          local project_root = vim.fn.findfile("settings.gradle", ".;") or vim.fn.findfile("build.gradle", ".;")
          return project_root and vim.fn.fnamemodify(project_root, ":h") or vim.fn.getcwd()
        end,
        require_cwd = true,
      },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_user_command("ConformFormat", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    vim.api.nvim_set_keymap('n', '<leader>F', ':ConformFormat<CR>', { noremap = true, silent = true })
    require("conform").setup(opts)
  end,
}
