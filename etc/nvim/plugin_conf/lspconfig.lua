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


-- {{{ Temp. fix for nvim-lsp-installer not getting PATHs right
-- (I know this isn't that good, but it will work for me, until the issue gets fixed)
--

-- Set some variables
path           = os.getenv("PATH")
nvimDataFolder = os.getenv("NVIM_DATA_FOLDER")
lspFolder      = nvimDataFolder .. "/lsp_servers/"
vim.fn.setenv("LSP_FOLDER", lspFolder)

-- Paths for all the LSPs I installed
arduino_language_server_path = lspFolder .. "arduino_language_server/"
bashls_path                  = lspFolder .. "bashls/node_modules/bash-language-server/bin/"
clangd_path                  = lspFolder .. "clangd/clangd/bin"
cmake_path                   = lspFolder .. "cmake/venv/bin/"
dockerls_path                = lspFolder .. "dockerls/node_modules/dockerfile-language-server-nodejs/bin/"
html_path                    = lspFolder .. "html/node_modules/vscode-langservers-extracted/bin/"
jdtls_path                   = lspFolder .. "jdtls/bin/"
pylsp_path                   = lspFolder .. "pylsp/venv/bin"
sumneko_lua_path             = lspFolder .. "sumneko_lua/extension/server/bin/"
texlab_path                  = lspFolder .. "texlab/"
vimls_path                   = lspFolder .. "vimls/node_modules/vim-language-server/bin/"
zeta_note_path               = lspFolder .. "zeta_note/"

-- Add all lsp paths to the $PATH
vim.fn.setenv("PATH", arduino_language_server_path .. ":" .. bashls_path .. ":" .. clangd_path .. ":" .. cmake_path .. ":" .. dockerls_path .. ":" .. html_path .. ":" .. jdtls_path .. ":" .. pylsp_path .. ":" .. sumneko_lua_path .. ":" .. texlab_path .. ":" .. vimls_path .. ":" .. zeta_note_path .. ":" .. path)
-- }}}
