
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/paulmartin/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/paulmartin/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'bling/vim-airline'
NeoBundle 'gregsexton/gitv'
NeoBundle 'editorconfig/editorconfig-vim'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set hidden
set title
syntax on

" Use spaces instead of tabs
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set backspace=indent,eol,start

:set rnu
