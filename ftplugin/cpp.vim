setlocal path+=/usr/include/c++/4.2.1

"marching
let g:marching_clang_command = '/usr/bin/clang++'
let g:marching_backend = 'sync_clang_command'
let g:marching_enable_neocomplete = 1
let g:marching_include_paths = ['/usr/include/c++/4.2.1']

"neocomplete
let g:neoinclude#paths = {'cpp' : '.,/usr/include/c++/4.2.1'}
let g:neoinclude#patterns = {'cpp' : '^\s*#\s*include'}
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

"標準ライブラリへのパスを設定
let $CPP_STDLIB = '/usr/include/c++/4.2.1'

augroup vimrc-set_filetype_cpp
    autocmd!
    "$CPP_STDLIBよりも下の階層のファイルが開かれて
    "filetypeが設定されていない場合にfiletype=cppを設定する
    autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END
