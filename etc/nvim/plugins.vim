""
"" plugins.vim by Andy3153
"" created   30/01/21 ~ 15:15:49
"" modified  26/04/22 ~ 14:38:02
""

" Install vim-plug if not installed
  if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
    " Download vim-plug
    echo "Downloading vim-plug package manager..."
    silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    " Install Plug packages
    echo "Installing packages..."
    autocmd VimEnter * PlugInstall

    echo "Installing coq_nvim dependencies..."
    autocmd VimEnter * COQdeps

    echo "Done!"
    echo ""
  endif


" Plugin list
  call plug#begin('$XDG_CONFIG_HOME/nvim/autoload/plugged')
    Plug 'nvim-lua/plenary.nvim'                         " Extra Lua functions
    Plug 'kyazdani42/nvim-web-devicons'                  " Icons
    Plug 'nvim-lualine/lualine.nvim'                     " Statusline
    Plug 'romgrk/barbar.nvim'                            " Tab bar
    Plug 'numToStr/FTerm.nvim'                           " Terminal
    Plug 'kevinhwang91/rnvimr'                           " File manager
    Plug 'petertriho/nvim-scrollbar'                     " Scrollbar
    Plug 'anuvyklack/pretty-fold.nvim'                   " Code folding support
    Plug 'yamatsum/nvim-cursorline'                      " Highlight similar stuff
    Plug 'farmergreg/vim-lastplace'                      " Remember last place in file
    Plug 'windwp/nvim-autopairs'                         " Bracket matching/pairing
    Plug 'andymass/vim-matchup'                          " Better '%'
    Plug 'tpope/vim-commentary'                          " Commands to comment text
    Plug 'lukas-reineke/indent-blankline.nvim'           " Indent lines
    Plug 'norcalli/nvim-colorizer.lua'                   " Render colors present in text
    Plug 'mhinz/vim-startify'                            " Start screen
    Plug 'andweeb/presence.nvim'                         " Discord Rich Presence (yes, really)
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'neovim/nvim-lspconfig'                         " LSP server configuration
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}            " Tab completion
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} " 9k+ snippets
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}       " third party sources

    "Plug 'arcticicestudio/nord-vim'                     " Nord
    "Plug 'fneu/breezy'                                  " Breeze Dark
    "Plug 'dracula/vim', { 'as': 'dracula' }             " Dracula
    "Plug 'morhetz/gruvbox'                              " Gruvbox
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}         " Catppuccin
  call plug#end()
