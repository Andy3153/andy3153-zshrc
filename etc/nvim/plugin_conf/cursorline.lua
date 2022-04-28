--
-- nvim-cursorline configuration
--

require('nvim-cursorline').setup
{
  cursorline =
  {
    enable = false,
  },
  cursorword =
  {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

vim.g.cursorline_disabled_filetypes = vim.g.buffertypes_to_exclude
vim.g.cursorline_disabled_buftypes = vim.g.buffertypes_to_exclude
vim.g.cursorword_disabled_filetypes = vim.g.buffertypes_to_exclude
vim.g.cursorword_disabled_buftypes = vim.g.buffertypes_to_exclude
