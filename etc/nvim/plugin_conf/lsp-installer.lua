--
-- nvim-lsp-installer configuration
--

require("nvim-lsp-installer").setup(
{
  -- ensure_installed = {  }, -- Servers to automatically install Example: {"rust_analyzer", "sumneko_lua"}
  automatic_installation = true, -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  ui =
  {
    icons =
    {
      server_installed = "◍", -- The list icon to use for installed servers.
      server_pending = "◍", -- The list icon to use for servers that are pending installation.
      server_uninstalled = "◍", -- The list icon to use for servers that are not installed.
    },
    keymaps =
    {
      toggle_server_expand = "<CR>", -- Keymap to expand a server in the UI
      install_server = "i", -- Keymap to install the server under the current cursor position
      update_server = "u", -- Keymap to reinstall/update the server under the current cursor position
      check_server_version = "c", -- Keymap to check for new version for the server under the current cursor position
      update_all_servers = "U", -- Keymap to update all installed servers
      check_outdated_servers = "C", -- Keymap to check which installed servers are outdated
      uninstall_server = "X", -- Keymap to uninstall a server
    },
  },
  install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" } -- The directory in which to install all servers.
  pip = {
    -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
    -- and is not recommended.
    --
    -- Example: { "--proxy", "https://proxyserver" }
    install_args = {},
  },
  log_level = vim.log.levels.INFO, -- Log level
  max_concurrent_installers = 4, -- Limit for simultaneous installs
})
