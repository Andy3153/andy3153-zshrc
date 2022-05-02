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
