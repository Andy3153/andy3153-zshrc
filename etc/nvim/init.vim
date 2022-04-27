""
"" init.vim by Andy3153
"" created   30/01/21 ~ 15:12:58
"" modified1 23/04/22 ~ 16:05:08
"" modified2 26/04/22 ~ 14:32:46
""

" Basic settings
  set number                 " Line numbering
  set relativenumber         " Relative line numbering
  set mouse=a                " Enable mouse support
  set clipboard+=unnamedplus " Use system clipboard (REQUIRES xclip or wl-clipboard)
  set noshowmode             " Disable default mode showing since we use a statusbar
  syntax on                  " Make sure syntax highlighting is on by default
  set shellcmdflag=-ic       " Make shell interactive
  set cursorline             " Highlight current line
  set cursorcolumn           " Highlight current column
  set undofile               " Undo persistence
  set showmatch              " Show matching bracket
  set incsearch              " Starts searching as soon as typing
  set ignorecase             " Ignore letter case when searching
  set smartcase              " Case insentive unless capitals used in search
  set termguicolors          " Required by nvim-colorizer

" Tabbing
  set tabstop=4              " length of <TAB>
  set softtabstop=-1         " length when editing text (0 for ‘tabstop’, -1 for ‘shiftwidth’)
  set shiftwidth=0           " length when shifting text (<<, >> and == commands) (0 for ‘tabstop’)
  set shiftround             " round indentation to multiples of 'shiftwidth' when shifting text
  set expandtab              " use spaces instead of <TAB>
  set autoindent             " reproduce the indentation of the previous line
  set smartindent            " increase the indenting level after ‘{’, decrease it after ‘}’
  filetype plugin indent on  " use language‐specific plugins for indenting

" Buffer types to exclude from various plugins
let g:buffertypes_to_exclude = [
      \ 'help',
      \ 'terminal',
      \ 'alpha',
      \ 'packer',
      \ 'lspinfo',
      \ 'TelescopePrompt',
      \ 'TelescopeResults',
      \ 'nvchad_cheatsheet',
      \ 'lsp-installer',
      \ 'startify',
      \ 'vim-plug',
      \ 'rnvimr',
      \ 'prompt',
      \ 'TelescopePrompt',
      \]

" Custom tabbing for specific languages
  autocmd FileType html,lua,markdown,nginx,none,python,sh,text,vim,zsh setlocal tabstop=2
  autocmd FileType tex,cdrtoc setlocal tabstop=1

" Replace stuff like :W to :w
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('W'))

" Plugins
  source $XDG_CONFIG_HOME/nvim/plugins.vim " load plugins list
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/lualine.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/barbar.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/coq.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/indent_blackline.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/catppuccin.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/startify.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/colorizer.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/treesitter.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/rnvimr.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/scrollbar.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/cursorline.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/autopairs.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/presence.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/pretty-fold.lua

" Colorscheme
  colorscheme catppuccin                                       " pick colorscheme
  autocmd VimEnter * highlight  Normal guibg=NONE ctermbg=NONE " disable backgroud
  autocmd VimEnter * highlight! link CursorColumn CursorLine   " same color for cursor line and cursor column

" Keybinds
  " Undo and redo
    nnoremap          U       <C-r>
    nnoremap          <C-z>   u
    nnoremap          <C-Z>   U
    inoremap          <C-z>   <ESC>ui
    inoremap          <C-Z>   <ESC>Ui

  " Commenting
    nnoremap <silent> <C-_>   :Commentary<CR>j
    vnoremap <silent> <C-_>   :Commentary<CR>
    inoremap <silent> <C-_>   <ESC>:Commentary<CR>a

  " BarBar
    nnoremap <silent> <A-l>   :BufferNext<CR>         " previous buffer
    nnoremap <silent> <A-h>   :BufferPrevious<CR>     " next buffer
    nnoremap <silent> <A-L>   :BufferMoveNext<CR>     " move to previous buffer
    nnoremap <silent> <A-H>   :BufferMovePrevious<CR> " move to next buffer
    nnoremap <silent> <A-x>   :BufferClose<CR>        " close current buffer

    nnoremap <silent> <A-r>   :RnvimrToggle<CR>       " open ranger in vim
