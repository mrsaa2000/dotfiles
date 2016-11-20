set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"neocompleteとjediの連携
setlocal omnifunc=jedi#completions
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patters')
    let g:neocomplete#force_omni_input_patters = {}
endif
let g:neocomplete#force_omni_input_patters.python = '\h\w*\|[^. \t]\.\w*'

"python_highlight
let g:python_highlight_all = 1
