--
-- indent-blankline.nvim configuration
--

-- Use comment color for lines
vim.api.nvim_exec([[ autocmd VimEnter * highlight! link IndentBlanklineChar Comment ]], false)

require("indent_blankline").setup
{
  -- Exclude filetypes
  filetype_exclude =
  {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "startify",
    "vim-plug",
  },
}
