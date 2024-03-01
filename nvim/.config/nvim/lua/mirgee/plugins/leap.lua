return {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat" },
  config = function()
    -- require('leap').create_default_mappings()
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)', { silent = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', { silent = true })
    vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)', { silent = true })

    require('leap').opts.special_keys.prev_target = '<bs>'
    require('leap').opts.special_keys.prev_group = '<bs>'
    require('leap.user').set_repeat_keys('<cr>', '<bs>')
  end
}
