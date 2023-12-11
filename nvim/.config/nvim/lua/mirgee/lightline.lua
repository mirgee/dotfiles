-- Lightline configuration
vim.g.lightline = {
  active = {
    left = {
      { 'mode', 'paste' },
      { 'readonly', 'gitbranch', 'filename', 'modified' }
    },
    right = {
      { 'lineinfo' },
      { 'percent' },
      { 'fileencoding', 'filetype' }
    }
  },
  component_function = {
    filename = 'LightlineFilename',
    gitbranch = 'FugitiveHead'
  }
}

-- Define the LightlineFilename function
function LightlineFilename()
  return vim.fn.expand('%:t') ~= '' and vim.fn.expand('%') or '[No Name]'
end
