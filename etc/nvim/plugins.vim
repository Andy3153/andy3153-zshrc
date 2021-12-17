""
"" plugins.vim by Andy3153
"" created 30/01/21 ~ 15:15:49
""


" Install vim-plug if not installed
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif

" Plugin list
  call plug#begin('~/.config/nvim/autoload/plugged')
    " lightline (statusbar)
      Plug 'itchyny/lightline.vim'

    " vim-airline (statusbar)
      "Plug 'vim-airline/vim-airline'
      "Plug 'vim-airline/vim-airline-themes'

    " nord-vim (colorscheme)
      "Plug 'arcticicestudio/nord-vim'
      
    " breezy (colorscheme)
      "Plug 'fneu/breezy'
    
    " dracula (colorscheme)
      Plug 'dracula/vim', { 'as': 'dracula' }

    " deoplete (tab completion)
      Plug 'Shougo/deoplete.nvim'

    " auto-pairs (pair parentheses etc.)
      Plug 'jiangmiao/auto-pairs'

    " barbar (tabs)
      Plug 'romgrk/barbar.nvim'

    " nvim-web-devicons
      Plug 'kyazdani42/nvim-web-devicons'

    " vim-lastplace
      Plug 'farmergreg/vim-lastplace'

    " coc
      Plug 'neoclide/coc.nvim', {'branch': 'release'}
      
    call plug#end()
