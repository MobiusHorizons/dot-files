
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

set runtimepath^=/Users/paulmartin/.config/nvim/repos/github.com/Shougo/dein.vim
set rtp+=~/.fzf

" Required:
if dein#load_state(expand('/Users/paulmartin/.config/nvim/'))
  call dein#begin(expand('/Users/paulmartin/.config/nvim/'))

  " Let dein manage dein
  " Required:
  call dein#add(expand('~/.config/nvim/repos/github.com/dein.vim'))

  " Add or remove your Bundles here:
  " GIT
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')   " Github browse for code
  call dein#add('gregsexton/gitv')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('/Users/paulmartin/src/fugitive-stash.vim') " stash browse for code

  " Navigation
  call dein#add('junegunn/fzf', { 'build': './install', 'rtp': '' })
  call dein#add('junegunn/fzf.vim', { 'depends' : 'fzf' })
  "call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('scrooloose/nerdcommenter')

  " Autocompletion
  call dein#add('Shougo/deoplete.nvim')

  " Languages
  call dein#add('sheerun/vim-polyglot')
  " - C
  "call dein#add('zchee/deoplete-clang')
  call dein#add('tweekmonster/deoplete-clang2')

  " - Javascript
  call dein#add('carlitux/deoplete-ternjs', {'on_ft' : 'javascript', 'build' : 'npm install -g tern'})
  call dein#add('pangloss/vim-javascript')
  "call dein#add('mxw/vim-jsx')
  call dein#add('wokalski/autocomplete-flow')
  call dein#add('mhartington/nvim-typescript')
  call dein#add('neomake/neomake')
  call dein#add('benjie/neomake-local-eslint.vim')

  " - Golang
  call dein#add('fatih/vim-go')
  call dein#add('nsf/gocode')
  "call dein#add('zchee/deoplete-go')

  " - rust
  call dein#add('rust-lang/rust.vim')
  call dein#add('sebastianmarkow/deoplete-rust')

  " - Demandware
  call dein#add('clavery/vim-dwre')

  " - python
  "call dein#add('zchee/deoplete-jedi')

  " - markdown
  "call dein#add('euclio/vim-markdown-composer', { 'on_ft' : 'markdown', 'build': 'cargo build --release' })

  " Interface
  "call dein#add('bling/vim-airline')
  call dein#add('itchyny/lightline.vim')
  call dein#add('ervandew/supertab')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('jceb/vim-orgmode')
  call dein#add('tpope/vim-speeddating')
  call dein#add('fmoralesc/vim-pad')

  " Code Cleanlines
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('Shutnik/jshint2.vim')
  call dein#add('godlygeek/tabular')

  " MISC
  "call dein#add('jaxbot/browserlink.vim.git')
  "call dein#add('nicwest/QQ.vim')
  "call dein#add('mattn/webapi-vim')
  call dein#add('critiqjo/lldb.nvim')
  call dein#add('tpope/vim-obsession') " session management

  " themes
  call dein#add('ap/vim-css-color')
  call dein#add('tyrannicaltoucan/vim-deep-space')
  call dein#add('tyrannicaltoucan/vim-quantum')
  call dein#add('joshdick/onedark.vim')
  call dein#add('trevordmiller/nova-vim')
  call dein#add('kristijanhusak/vim-hybrid-material')
  call dein#add('drewtempelmeyer/palenight.vim')
  call dein#add('morhetz/gruvbox')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
filetype plugin on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

" clang completion settings
let g:clang_library_path='/usr/local/lib/libclang.dylib'

" Deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
call deoplete#enable_logging('DEBUG', '/Users/paulmartin/.config/nvim/deoplete.log')

"if !exists('g:deoplete#omni#input_patterns')
  "let g:deoplete#omni#input_patterns = {}
"endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"" Tern Deoplete settings
"let g:deoplete#sources#ternjs#tern_bin = '/Users/paulmartin/.nvm/versions/node/v8.2.1/bin/tern'
"let g:deoplete#sources#ternjs#types = 1
"let g:deoplete#sources#ternjs#filter = 0
"let g:deoplete#sources#ternjs#case_insensitive = 1

"Add extra filetypes
"let g:deoplete#sources#ternjs#filetypes = [
                "\ 'jsx',
                "\ 'javascript.jsx',
                "\ 'vue',
                "\ ]

" omnifuncs
"augroup omnifuncs
  "autocmd!
  "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
	let g:tern#command = ["/Users/paulmartin/.nvm/versions/node/v8.2.1/bin/tern"]
	let g:tern#arguments = ["--persistent"]

  autocmd FileType javascript setlocal omnifunc=tern:Complete
endif

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
"set tabstop=2 shiftwidth=2 softtabstop=2 expandtab        " Use spaces instead of tabs
set autoindent noexpandtab tabstop=4 shiftwidth=4         " Use 4-wide tabs
set backspace=indent,eol,start                            " sane backspace
"set rnu
set number
set cursorline                                            " highlight current line
"set textwidth=120                                         " wrap at 120 characters
set scrolloff=10                                          " scroll the window so we can always see 10 lines around the cursor
set clipboard+=unnamed,unnamedplus                        " use the system clipboard for yank/put/delete
set noerrorbells                                          " No Beeps.
set inccommand=nosplit
let mapleader="\<SPACE>"

" show whitespace
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Appearance                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
"let g:gruvbox_contrast_dark='hard'
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if has("termguicolors")
    set termguicolors
endif

" show suggested wrap at 80 and 120
let &colorcolumn="101,121"
highlight ColorColumn ctermbg=239 guibg=#A8CE93

"let g:airline_theme='deepspace'
"let g:quantum_black = 1
"let g:quantum_italics = 1
""colorscheme onedark
colorscheme palenight
let g:palenight_terminal_italics = 1

""#D18EC2

"let g:airline_powerline_fonts = 1

"if !exists('g:airlinesymbols')
  "let g:airlinesymbols = {}
"endif

""let g:airlineleftsep = '»'
""let g:airlineleftsep = '?'
""let g:airlinerightsep = '«'
"let g:airlinerightsep           = '?'
"let g:airlinesymbols.linenr     = '?'
"let g:airlinesymbols.linenr     = '?'
"let g:airlinesymbols.linenr     = '¶'
"let g:airlinesymbols.branch     = '? '
"let g:airlinesymbols.paste      = '?'
"let g:airlinesymbols.paste      = 'Þ'
"let g:airlinesymbols.paste      = '?'
"let g:airlinesymbols.whitespace = '?'
" JSHint options
"let jshint2_read = 1
"let jshint2_save = 1
"

" Vim Pad
let g:pad#dir = '/Users/paulmartin/notes'

" Flow
let g:flow#enable = 0


" Javascript

let g:javascript_plugin_jsdoc           = 1
let g:javascript_plugin_flow            = 1
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_arrow_function = "⇒"

let g:neomake_javascript_enabled_makers = ['eslint']

set conceallevel=1

" fugitive stash instances
let g:fugitive_stash_domains = ['stash.cqlcorp.net', 'bitbucket.org']

au FileType javascript setl omnifunc=tern#Complete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent", "--no-port-file"]

" Custom Shortcuts
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>ag :Ag
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>cd :lcd %:p:h<CR>:pwd<CR>
nnoremap <Leader>rr :call QQ#request#send()<CR>
nnoremap <Leader>pp :%!python -m json.tool<CR>


" ------------------- lldb -------------------- "
    nmap <Leader>br <Plug>LLBreakSwitch
    vmap <F2> <Plug>LLStdInSelected
    nnoremap <F4> :LLstdin<CR>
    nnoremap <F5> :LLmode debug<CR>
    nnoremap <S-F5> :LLmode code<CR>
    nnoremap <F8> :LL continue<CR>
    nnoremap <S-F8> :LL process interrupt<CR>
    nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
    vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

"command ToCSS
      "\ %s/}\s*,/}/ |
      "\ %s/\(\d\+\),$/\1px;/ |
      "\ %s/,\s*$/;/ |
      "\ %s/\(\w\+\)\s\?: {/.\1 {/ |
      "\ %s/\([a-z]\+\)\([A-Z]\)\(\w\+\)\s*:/\1-\L\2\3 :/ |
      "\ %s/'\([^']\+\)'/\1/


nnoremap ; :
nnoremap Q q
nnoremap <ESC> :noh<CR>

let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'  ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'  ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filetype': 'MyFiletype'
      \ },
      \ }

let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

" Racer Setup for Rust
if executable('racer')
  let g:deoplete#sources#rust#racer_binary = systemlist('which racer')[0]
endif

if executable('rustc')
    " if src installed via rustup, we can get it by running
    " rustc --print sysroot then appending the rest of the path
    let rustc_root = systemlist('rustc --print sysroot')[0]
    let rustc_src_dir = rustc_root . '/lib/rustlib/src/rust/src'
    if isdirectory(rustc_src_dir)
        let g:deoplete#sources#rust#rust_source_path = rustc_src_dir
    endif
endif
