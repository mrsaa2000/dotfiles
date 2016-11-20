"dein
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
    set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
    execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add("Shougo/neoinclude.vim")
call dein#add('davidhalter/jedi-vim')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('andviro/flake8-vim')
call dein#add('hdima/python-syntax')
call dein#add('kana/vim-smartinput')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('fatih/vim-go')
call dein#add('Mizuchi/STL-Syntax')
call dein#add('osyo-manga/vim-marching')

call dein#end()

if dein#check_install()
    call dein#install()
endif

set tabstop=4
set number
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set clipboard=unnamed
set backspace=indent,eol,start
set completeopt-=preview
set mouse=a
set ttymouse=xterm2
set list
set listchars=tab:>- 
set cursorline
hi clear CursorLine
syntax enable
colorscheme monokai
filetype plugin indent on

let g:neocomplete#enable_at_startup = 1

"C++
function! Run()
    :w
    :!clang++ -std=c++14 % -o %:r
    :!./%:r
endfunction

command! Clang call Run()

autocmd BufNewFile,BufRead *.py nnoremap <f5> :!python3 %
autocmd BufNewFile,BufRead *.go nnoremap <f5> :GoRun %
autocmd BufNewFile,BufRead *.d nnoremap <f5> :!rdmd %
autocmd BufNewFile,BufRead *.cpp nnoremap <f5> :Clang
