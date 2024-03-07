return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')

    local map = function(lhs, rhs, desc)
      if desc then
        desc = "[DAP] " .. desc
      end

      vim.keymap.set("n", lhs, rhs, { desc = desc })
    end

    map("<F1>", dap.step_back, "step_back")
    map("<F2>", dap.step_into, "step_into")
    map("<F3>", dap.step_over, "step_over")
    map("<F4>", dap.step_out, "step_out")
    map("<F5>", dap.continue, "continue")

    map("<leader>dr", dap.repl.open)

    map("<leader>db", dap.toggle_breakpoint)
    map("<leader>dB", function()
      dap.set_breakpoint(vim.fn.input "[DAP] Condition > ")
    end)

    vim.cmd [[
augroup DapRepl
  au!
  au FileType dap-repl lua require('dap.ext.autocompl').attach()
augroup END
]]

    dap.adapters.rust = {
      type = 'executable',
      -- GDB v14.0+ required
      command = '/usr/local/bin/gdb',
      args = { "-i", "dap" }
    }

    dap.configurations.rust = {
      {
        name = "Debug specific Rust test",
        type = "rust",
        request = "launch",
        program = function()
          return vim.fn.input('Path to test executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        args = function()
          local arguments = vim.fn.input('Extra arguments: ')
          return { arguments }
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        runInTerminal = false
      },
    }
  end
}
