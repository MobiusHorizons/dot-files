
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/paulmartin/.vim/bundle/neobundle.vim/
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
NeoBundle 'Shougo/neocomplete' " for vim only
NeoBundle 'fatih/vim-go'
"NeoBundle 'Shougo/deoplete.nvim' " for neovim only
NeoBundle 'bling/vim-airline'
NeoBundle 'gregsexton/gitv'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'pangloss/vim-javascript', {'rev' : 'c378730'}
NeoBundle 'justmao945/vim-clang'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'godlygeek/tabular'
call neobundle#end()

filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let g:deoplete#enable_at_startup = 1

set hidden
set title
syntax on

" Use spaces instead of tabs
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set backspace=indent,eol,start

set rnu
set number
set cursorline

" JSHint options
let jshint2_read = 1
let jshint2_save = 1
