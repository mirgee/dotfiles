return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    { "mfussenegger/nvim-dap" },
  },
  opts = {
    layouts = {
      {
        elements = {
          "scopes",
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40,
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 10,
        position = "bottom",
      },
    },
    -- -- You can change the order of elements in the sidebar
    -- sidebar = {
    --   elements = {
    --     -- Provide as ID strings or tables with "id" and "size" keys
    --     {
    --       id = "scopes",
    --       size = 0.75, -- Can be float or integer > 1
    --     },
    --     { id = "watches", size = 00.25 },
    --   },
    --   size = 50,
    --   position = "left", -- Can be "left" or "right"
    -- },
    --
    -- tray = {
    --   elements = {},
    --   size = 15,
    --   position = "bottom", -- Can be "bottom" or "top"
    -- },
  },
  config = function(_, opts)
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup(opts)

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "[DAP] Eval" })
    vim.keymap.set("n", "<leader>dE", function()
      dapui.eval(vim.fn.input "[DAP] Expression > ")
    end, { desc = "[DAP] Expression" })
  end
}
