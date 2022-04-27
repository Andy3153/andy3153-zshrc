--
-- Startify configuration
--

-- A couple of splash screens
  vim.g.ascii_nvim_2d =
  {
    '   /‾| /‾/__  ____|‾|  /‾(_)___ ___ ',
    '  /  |/ / _ \\/ __ \\ | / / / __ `__ \\',
    ' / /|  /  __/ /_/ / |/ / / / / / / /',
    '/_/ |_/\\___/\\____/|___/_/_/ /_/ /_/ '
  }
      

  vim.g.ascii_nvim_3d =
  {
    ' ___   __    ______   ______   __   __   ________  ___ __ __     ',
    '/__/\\ /__/\\ /_____/\\ /_____/\\ /_/\\ /_/\\ /_______/\\/__//_//_/\\    ',
    '\\::\\_\\\\  \\ \\\\::::_\\/_\\:::_ \\ \\\\:\\ \\\\ \\ \\\\__.::._\\/\\::\\| \\| \\ \\   ',
    ' \\:. `-\\  \\ \\\\:\\/___/\\\\:\\ \\ \\ \\\\:\\ \\\\ \\ \\  \\::\\ \\  \\:.      \\ \\  ',
    '  \\:. _    \\ \\\\::___\\/_\\:\\ \\ \\ \\\\:\\_/.:\\ \\ _\\::\\ \\__\\:.\\-/\\  \\ \\ ',
    '   \\. \\`-\\  \\ \\\\:\\____/\\\\:\\_\\ \\ \\\\ ..::/ //__\\::\\__/\\\\. \\  \\  \\ \\',
    '    \\__\\/ \\__\\/ \\_____\\/ \\_____\\/ \\___/_( \\________\\/ \\__\\/ \\__\\/'
  }

  vim.g.ascii_nvim_3d_2 =
  {
    '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝'
  }


-- Set the custom header
  vim.g.startify_custom_header = 'startify#center(g:ascii_nvim_3d)'

  vim.g.startify_bookmarks =
  {
    '~/.config/zsh/zshrc',
    '~/.config/zsh/aliasrc',
    '~/.config/zsh/keysrc',
    '~/.config/zsh/themerc',
    '~/.config/nvim/init.vim',
    '~/.config/nvim/plugins.vim'
  }
