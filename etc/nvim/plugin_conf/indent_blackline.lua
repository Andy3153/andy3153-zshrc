--
-- indent-blankline.nvim configuration
--

-- Use comment color for lines
vim.api.nvim_exec([[ autocmd VimEnter * highlight! link IndentBlanklineChar Comment ]], false)

require("indent_blankline").setup
{
  filetype_exclude = vim.g.buffertypes_to_exclude -- Exclude filetypes
}
