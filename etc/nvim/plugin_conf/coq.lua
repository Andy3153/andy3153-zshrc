--
-- coq_nvim configuration
--

-- Enable coq
  -- vim.call('autocmd', 'VimEnter', '*', 'COQnow', '--shut-up')
  vim.g.coq_settings = { auto_start = 'shut-up' }
  -- local vim.g.coq_settings = { 'auto_start': 'shut-up' }

-- LSP
  local lsp = require "lspconfig"
  local coq = require "coq"

