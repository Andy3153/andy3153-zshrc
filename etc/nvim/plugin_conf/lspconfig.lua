-- vim:fileencoding=utf-8:foldmethod=marker
--
-- nvim-lspconfig configuration
--

-- Configure all LSP servers with coq
for _, lsp in ipairs(vim.g.lspservers_to_install) do
  require('lspconfig')[lsp].setup(require('coq').lsp_ensure_capabilities({
    -- on_attach = my_custom_on_attach,
  }))
end

-- Appearance
vim.diagnostic.config(
{
  virtual_text =
  {
    prefix = '■', -- Could be '●', '▎', 'x'
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Symbols for sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
