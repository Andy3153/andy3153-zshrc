"" vim:fileencoding=utf-8:foldmethod=marker
""
"" init.vim by Andy3153
"" created   30/01/21 ~ 15:12:58
"" modified1 23/04/22 ~ 16:05:08
"" modified2 26/04/22 ~ 14:32:46
""

" {{{ Variables
  " Folders
    let $NVIM_CONFIG_FOLDER = stdpath('config')
    let $NVIM_DATA_FOLDER = stdpath('data')
  
  " Buffer types to exclude from various plugins
    let g:buffertypes_to_exclude =
      \[
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

  " LSP servers to install
    let g:lspservers_to_install = 
      \[
      \ 'arduino_language_server',
      \ 'bashls',
      \ 'clangd',
      \ 'cmake',
      \ 'dockerls',
      \ 'html',
      \ 'jdtls',
      \ 'pylsp',
      \ 'sumneko_lua',
      \ 'texlab',
      \ 'vimls',
      \ 'zeta_note',
      \]
" }}}

" {{{ Basic settings
  set number                 " Line numbering
  set relativenumber         " Relative line numbering
  set nocompatible           " Disable Vi compatibility
  "set numberwidth=6          " Line numbering column width
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
  set foldmethod=indent      " Fold code
  set foldlevel=99           " Max nested fold count
  set signcolumn=yes         " Keep signcolumn always on
  set splitbelow             " Open split below
  set splitright             " Open vsplit on right
" }}}

" {{{ Tabbing
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
" }}}

" {{{ Plugins
  source $NVIM_CONFIG_FOLDER/plugins.vim " load plugins list
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/lualine.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/barbar.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/coq.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/lsp-installer.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/lspconfig.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/indent_blackline.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/catppuccin.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/startify.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/colorizer.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/treesitter.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/fterm.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/rnvimr.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/scrollbar.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/cursorline.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/autopairs.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/presence.lua
  "luafile $NVIM_CONFIG_FOLDER/plugin_conf/pretty-fold.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/comment.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/jaq.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/gomove.lua
  luafile $NVIM_CONFIG_FOLDER/plugin_conf/which-key.lua
" }}}

" {{{ Colorscheme
  colorscheme catppuccin                                       " pick colorscheme
  autocmd VimEnter * highlight  Normal guibg=NONE ctermbg=NONE " disable backgroud
  autocmd VimEnter * highlight! link CursorColumn CursorLine   " same color for cursor line and cursor column
" }}}

" {{{ Keybinds
  " Undo and redo
    nnoremap          U       <C-r>
    nnoremap          <C-z>   u
    nnoremap          <C-Z>   U
    inoremap          <C-z>   <ESC>ui
    inoremap          <C-Z>   <ESC>Ui

  " Splits
    " Create splits
    nnoremap          <A-(>   <C-w><C-v>
    nnoremap          <A-)>   <C-w><C-s>
    " Move to splits
    nnoremap          <A-h>   <C-w><C-h>
    nnoremap          <A-j>   <C-w><C-j>
    nnoremap          <A-k>   <C-w><C-k>
    nnoremap          <A-l>   <C-w><C-l>
    " Move splits
    nnoremap <silent> <C-A-h> :WinShift left<CR>
    nnoremap <silent> <C-A-j> :WinShift down<CR>
    nnoremap <silent> <C-A-k> :WinShift up<CR>
    nnoremap <silent> <C-A-l> :WinShift right<CR>
    " Resize splits
    nnoremap <silent> <A-H>   :lua require('smart-splits').resize_left()<CR>
    nnoremap <silent> <A-J>   :lua require('smart-splits').resize_down()<CR>
    nnoremap <silent> <A-K>   :lua require('smart-splits').resize_up()<CR>
    nnoremap <silent> <A-L>   :lua require('smart-splits').resize_right()<CR>
    nnoremap          <A-=>   <C-w><C-=>
    

  " Commenting
    nnoremap <silent> <C-_>   <Plug>(comment_toggle_current_linewise)<CR>
    vnoremap <silent> <C-_>   <Plug>(comment_toggle_blockwise_visual)<CR>
    inoremap <silent> <C-_>   <ESC><Plug>(comment_toggle_current_linewise)<CR>ki

  " BarBar
    " Move to buffers
    nnoremap <silent> <A-.>   :BufferNext<CR>
    nnoremap <silent> <A-,>   :BufferPrevious<CR>
    " Move buffers
    nnoremap <silent> <A->>   :BufferMoveNext<CR>
    nnoremap <silent> <A-<>   :BufferMovePrevious<CR>
    " Close buffers
    nnoremap <silent> <A-x>   :BufferClose<CR>
    nnoremap <silent> <A-q>   :BufferClose<CR>
    nnoremap <silent> <A-X>   :BufferClose!<CR>
    nnoremap <silent> <A-Q>   :BufferClose!<CR>
    " Go to buffers
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

  " GoMove
    nnoremap <silent> <S-h>   <Plug>GoNSMLeft
    nnoremap <silent> <S-j>   <Plug>GoNSMDown
    nnoremap <silent> <S-k>   <Plug>GoNSMUp
    nnoremap <silent> <S-l>   <Plug>GoNSMRight
    
    vnoremap <silent> <S-h>   <Plug>GoVSMLeft
    vnoremap <silent> <S-j>   <Plug>GoVSMDown
    vnoremap <silent> <S-k>   <Plug>GoVSMUp
    vnoremap <silent> <S-l>   <Plug>GoVSMRight
    
    nnoremap <silent> <C-h>   <Plug>GoNSDLeft
    nnoremap <silent> <C-j>   <Plug>GoNSDDown
    nnoremap <silent> <C-k>   <Plug>GoNSDUp
    nnoremap <silent> <C-l>   <Plug>GoNSDRight
    
    vnoremap <silent> <C-h>   <Plug>GoVSDLeft
    vnoremap <silent> <C-j>   <Plug>GoVSDDown
    vnoremap <silent> <C-k>   <Plug>GoVSDUp
    vnoremap <silent> <C-l>   <Plug>GoVSDRight

  " Accelerated-JK
    nmap j <Plug>(accelerated_jk_gj)
    nmap k <Plug>(accelerated_jk_gk)
" }}}

" {{{ Others
" Highlight yanks
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
  augroup END

" Replace stuff like :W to :w
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('W'))
" }}}
