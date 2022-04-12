""
"" init.vim by Andy3153
"" created  30/01/21 ~ 15:12:58
"" modified 16/02/22 ~ 14:06:58
""

" Plugins
  source $XDG_CONFIG_HOME/nvim/plugins.vim

" Set colorscheme
  " for neovim
    autocmd VimEnter * hi Normal ctermbg=none "disable background for colorscheme
    "let g:gruvbox_contrast_dark = 'soft'
    colorscheme catppuccin

    lua require("colorscheme")
    
    "let g:transparent_background = 'true'

  " for lightline (statusbar)
    let g:lightline = {'colorscheme': 'catppuccin'}

" Makes the shell interactive
  :set shellcmdflag=-ic

" Disables native insert status since we have a statusbar
  set noshowmode

" Enables syntax highlighting
  :syntax on

" Shows line numbers
  " Relative line numbering
    ":set rnu

  " Normal line numbering
    :set nu

" Enables mouse support
  :set mouse=a

" Replace stuff like :W to :w
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('W'))

" Keybinds
  " hjkl movements in Insert mode via the <Alt> modifier key
    inoremap <A-h> <C-o>h
    inoremap <A-j> <C-o>j
    inoremap <A-k> <C-o>k
    inoremap <A-l> <C-o>l
    inoremap <A-w> <C-o>w
    "inoremap <A-e> <C-o>e "doesn't work well
    "inoremap <A-b> <C-o>b "doesn't work well
    inoremap <A-0> <C-o>0
    inoremap <A-$> <C-o>$

  " for BarBar
    " Move to previous/next
      nnoremap <silent>    <A-,> :BufferPrevious<CR>
      nnoremap <silent>    <A-.> :BufferNext<CR>
    " Re-order to previous/next
      nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
      nnoremap <silent>    <A->> :BufferMoveNext<CR>
    " Close buffer
      nnoremap <silent>    <A-x> :BufferClose<CR>
