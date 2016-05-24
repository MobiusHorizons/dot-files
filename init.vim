
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction


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
NeoBundle 'ternjs/tern_for_vim', { 'do' : 'npm install' }
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'wincent/command-t'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'Shougo/neocomplete' " for vim only
NeoBundle 'fatih/vim-go'
NeoBundle 'nsf/gocode'
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}
NeoBundle 'Shougo/deoplete.nvim' " for neovim only
NeoBundle 'carlitux/deoplete-ternjs', {'build' : {'mac': 'npm install -g tern', 'unix': 'npm install -g tern'}}
NeoBundle 'bling/vim-airline'
NeoBundle 'gregsexton/gitv'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'pangloss/vim-javascript' , {'rev' : 'c378730'}
NeoBundle 'ervandew/supertab'
NeoBundle "clavery/vim-dwre"

"NeoBundle 'justmao945/vim-clang'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'godlygeek/tabular'
"NeoBundle 'freeo/vim-kalisi'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'floobits/floobits-neovim'
NeoBundle 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
NeoBundle "jaxbot/browserlink.vim.git"
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'racer-rust/vim-racer'

call neobundle#end()

filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" Deoplete settings
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern:Complete
endif

let g:racer_cmd = "/Users/paulmartin/.cargo/bin/racer"
let $RUST_SRC_PATH = "/Users/paulmartin/.rust/src"

" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" fzf




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
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
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

au FileType javascript setl omnifunc=tern#Complete
