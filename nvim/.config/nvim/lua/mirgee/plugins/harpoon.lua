return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    global_settings = {
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = false,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = false,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon" },

      -- set marks specific to each git branch inside git repository
      mark_branch = false,

      -- enable tabline with harpoon marks
      tabline = false,
      tabline_prefix = "   ",
      tabline_suffix = "   ",
    },
  },
  config = function()
    require("telescope").load_extension("harpoon")

    local hui = require("harpoon.ui")
    local hcmdui = require("harpoon.cmd-ui")
    local hm = require("harpoon.mark")
    local ht = require("harpoon.term")

    vim.keymap.set("n", "<leader>hm", hm.add_file, { desc = "Harpoon: Mark File" })
    vim.keymap.set("n", "<leader>he", hui.toggle_quick_menu, { desc = "Harpoon: Toggle Menu" })
    vim.keymap.set("n", "<leader>hc", hcmdui.toggle_quick_menu, { desc = "Harpoon: Commands Menu" })

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>h" .. i, function()
        hui.nav_file(i)
      end, { desc = "Harpoon: Go to Mark " .. i })
    end

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>t" .. i, function()
        ht.gotoTerminal(i)
      end, { desc = "Harpoon: Go to Terminal " .. i })
    end

    for i = 1, 9 do
      for j = 1, 9 do
        vim.keymap.set("n", "<leader>c" .. i .. j, function()
          ht.sendCommand(i, j)
          ht.sendCommand(i, "\n")
        end, { desc = "Harpoon: Send Command " .. i .. " to Terminal " .. j })
      end
    end

    vim.api.nvim_create_user_command("Ht", function(input)
      local args = vim.split(input.args, " ", { trimempty = true })
      if #args < 2 then
        print("Usage: :Ht <terminal_number> <command>")
        return
      end

      local term_num = tonumber(args[1])
      if not term_num then
        print("Invalid terminal number")
        return
      end

      local command_index = tonumber(args[2])
      if command_index then
        ht.sendCommand(term_num, command_index)
      else
        table.remove(args, 1)
        local command = table.concat(args, " ")
        ht.sendCommand(term_num, command)
      end

      ht.sendCommand(term_num, "\n")
    end, { nargs = "*", desc = "Send command to Harpoon terminal" })
  end,
}
