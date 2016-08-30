set history=20
set ruler
set shiftwidth=2
set smartindent
set backspace=2
set whichwrap=24
set showmatch
set splitbelow
set laststatus=2
set expandtab
autocmd BufRead *.html set shiftwidth=2

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,utf-8
set fileformats=unix,dos,mac
set fenc=utf-8
set enc=utf-8
set cursorline
set hlsearch
set number
set undofile
set undodir=~/.vim/undodir


set statusline=%<%f\ %{'['.(&fenc!=''?&fenc:&enc).']'}%=%l,%c\ \ 

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

filetype on
filetype indent on
filetype plugin on
colorscheme molokai


syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

"neobundle--------------------------------------------------------------------------

set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
  NeoBundleFetch 'Shougo/neobundle.vim'
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mbbill/undotree'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jacquesbh/vim-showmarks'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'visualmark.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'thinca/vim-ref'


  call neobundle#end()
endif

nnoremap <silent><C-e> :NERDTreeToggle<CR>
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
filetype plugin indent on     " required!
filetype indent on
syntax on
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>


if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    " neocomplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"


"---------------------------------- Mark start
" viminfo
" http://vimwiki.net/?%27viminfo%27
set viminfo='50,\"1000,:0,n~/.vim/viminfo

" unite mark
" https://github.com/tacroe/unite-mark
" http://d.hatena.ne.jp/tacroe/20101119/1290115586
nnoremap <silent> m, :Unite mark<CR>

" mark auto reg
" http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif
nnoremap <silent>m :<C-u>call <SID>AutoMarkrement()<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

" visualmark.vim
" http://nanasi.jp/articles/vim/visualmark_vim.html
" map <unique> <C-F3> <Plug>Vm_toggle_sign
"----------------------------------- Mark Ends

