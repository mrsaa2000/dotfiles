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
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
call dein#add('jmcantrell/vim-virtualenv', {'on_ft': 'python'})
call dein#add('andviro/flake8-vim', {'on_ft': 'python'})
call dein#add('hdima/python-syntax', {'on_ft': 'python'})
call dein#add('hynek/vim-python-pep8-indent', {'on_ft': 'python'})
call dein#add('kana/vim-smartinput')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('fatih/vim-go', {'on_ft': 'go'})
call dein#add('Mizuchi/STL-Syntax', {'on_ft': 'cpp'})
call dein#add('osyo-manga/vim-marching', {'on_ft': 'cpp'})
call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown'})
call dein#add('kannokanno/previm', {'on_ft': 'markdown'})
call dein#add('tyru/open-browser.vim', {'on_ft': 'markdown'})
call dein#add('itchyny/vim-haskell-indent', {'on_ft': 'haskell'})
call dein#add('eagletmt/ghcmod-vim', {'on_ft': 'haskell'})
call dein#add('ujihisa/neco-ghc', {'on_ft': 'haskell'})
call dein#add('peterhoeg/vim-qml', {'on_ft': 'qml'})

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
set ruler
hi clear CursorLine
set ignorecase
set smartcase
set infercase
syntax enable
colorscheme monokai
filetype plugin indent on

let g:neocomplete#enable_at_startup = 1

let $BASH_ENV = "~/.bashrc"

function! Run()
    :w
    :!clang++ -std=c++14 % -o %:r
    :!./%:r
endfunction
command! Clang call Run()

autocmd BufNewFile,BufRead,TabEnter *.py nnoremap <f5> :!python3 %
autocmd BufNewFile,BufRead,TabEnter *.go nnoremap <f5> :GoRun %
autocmd BufNewFile,BufRead,TabEnter *.d nnoremap <f5> :!rdmd %
autocmd BufNewFile,BufRead,TabEnter *.cpp nnoremap <f5> :Clang
autocmd BufNewFile,BufRead,TabEnter *.hs nnoremap <f5> :!runghc %
autocmd BufNewFile,BufRead,TabEnter *.rb nnoremap <f5> :!ruby %
autocmd BufNewFile,BufRead,TabEnter *.qml nnoremap <f5> :!qmlscene %

au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg = 248
hi IndentGuidesEven ctermbg = 240
