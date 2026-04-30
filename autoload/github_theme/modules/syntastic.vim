" autoload/github_theme/modules/syntastic.vim
" Groups for vim-syntastic/syntastic

function! github_theme#modules#syntastic#get(spec, opts) abort
  return {
    \ 'SyntasticErrorSign':       { 'fg': a:spec.diag.error },
    \ 'SyntasticWarningSign':     { 'fg': a:spec.diag.warn },
    \ 'SyntasticStyleErrorSign':  { 'fg': a:spec.diag.error },
    \ 'SyntasticStyleWarningSign':{ 'fg': a:spec.diag.warn },
    \ 'SyntasticError':           { 'sp': a:spec.diag.error, 'style': 'undercurl' },
    \ 'SyntasticWarning':         { 'sp': a:spec.diag.warn,  'style': 'undercurl' },
    \ 'SyntasticStyleError':      { 'sp': a:spec.diag.error, 'style': 'undercurl' },
    \ 'SyntasticStyleWarning':    { 'sp': a:spec.diag.warn,  'style': 'undercurl' },
    \ 'SyntasticErrorLine':       { 'bg': a:spec.diag_bg.error },
    \ 'SyntasticWarningLine':     { 'bg': a:spec.diag_bg.warn }
  \ }
endfunction
