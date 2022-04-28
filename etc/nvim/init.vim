""
"" init.vim by Andy3153
"" created   30/01/21 ~ 15:12:58
"" modified1 23/04/22 ~ 16:05:08
"" modified2 26/04/22 ~ 14:32:46
""

" Basic settings
  set number                 " Line numbering
  set relativenumber         " Relative line numbering
  set nocompatible           " Disable Vi compatibility
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

" Custom tabbing for specific languages
  autocmd FileType html,lua,markdown,nginx,none,python,sh,text,vim,zsh setlocal tabstop=2
  autocmd FileType tex,cdrtoc setlocal tabstop=1

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
      \ 'FTerm',
      \]

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
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/fterm.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/rnvimr.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/scrollbar.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/cursorline.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/autopairs.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/presence.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/pretty-fold.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/comment.lua
  luafile $XDG_CONFIG_HOME/nvim/plugin_conf/jaq.lua

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
    nnoremap <silent> <C-_>   <Plug>(comment_toggle_current_linewise)<CR>
    vnoremap <silent> <C-_>   <Plug>(comment_toggle_blockwise_visual)<CR>
    inoremap <silent> <C-_>   <ESC><Plug>(comment_toggle_current_linewise)<CR>ki

  " BarBar
    nnoremap <silent> <A-l>   :BufferNext<CR>
    nnoremap <silent> <A-h>   :BufferPrevious<CR>
    nnoremap <silent> <A-L>   :BufferMoveNext<CR>
    nnoremap <silent> <A-H>   :BufferMovePrevious<CR>
    nnoremap <silent> <A-x>   :BufferClose<CR>
    nnoremap <silent> <A-q>   :BufferClose<CR>
    nnoremap <silent> <A-1>   :BufferGoto 1<CR>
    nnoremap <silent> <A-2>   :BufferGoto 2<CR>
    nnoremap <silent> <A-3>   :BufferGoto 3<CR>
    nnoremap <silent> <A-4>   :BufferGoto 4<CR>
    nnoremap <silent> <A-5>   :BufferGoto 5<CR>
    nnoremap <silent> <A-6>   :BufferGoto 6<CR>
    nnoremap <silent> <A-7>   :BufferGoto 7<CR>
    nnoremap <silent> <A-8>   :BufferGoto 8<CR>
    nnoremap <silent> <A-9>   :BufferGoto 9<CR>
    nnoremap <silent> <A-0>   :BufferGoto 10<CR>

  " Jaq    (Alt+E; `E` from "Execute")
    nnoremap <silent> <A-e>   :Jaq<CR>

  " Rnvimr (Alt+R; `R` from "Ranger")
    nnoremap <silent> <A-r>   :RnvimrToggle<CR>
    tnoremap <silent> <A-r>   <C-\><C-n>:RnvimrToggle<CR>
  
  " FTerm  (Alt+T; `T` from "Terminal")
    nnoremap <silent> <A-t>   <CMD>lua require("FTerm").toggle()<CR>
    tnoremap <silent> <A-t>   <C-n><CMD>lua require("FTerm").toggle()<CR>
