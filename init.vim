
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'ternjs/tern_for_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'Shougo/neocomplete' " for vim only
NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/deoplete.nvim' " for neovim only
NeoBundle 'bling/vim-airline'
NeoBundle 'gregsexton/gitv'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'pangloss/vim-javascript' ", {'rev' : 'c378730'}

NeoBundle 'justmao945/vim-clang'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'godlygeek/tabular'
"NeoBundle 'freeo/vim-kalisi'
NeoBundle 'morhetz/gruvbox'

call neobundle#end()

filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let g:deoplete#enable_at_startup = 1

" General settings
set hidden
set title
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab        " Use spaces instead of tabs
set backspace=indent,eol,start                            " sane backspace
set rnu
set number
set cursorline                                            " highlight current line
set textwidth=120                                         " wrap at 120 characters
set scrolloff=10                                          " scroll the window so we can always see 10 lines around the cursor
set clipboard+=unnamed,unnamedplus                        " use the system clipboard for yank/put/delete


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Appearance                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme gruvbox
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" show suggested wrap at 80 and 120
let &colorcolumn="81,82,83,121,122,123"
highlight ColorColumn ctermbg=239 guibg=#3c3d3c

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" JSHint options
"let jshint2_read = 1
"let jshint2_save = 1
