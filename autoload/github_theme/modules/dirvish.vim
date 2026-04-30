" autoload/github_theme/modules/dirvish.vim
" Groups for justinmk/vim-dirvish

function! github_theme#modules#dirvish#get(spec, opts) abort
  return {
    \ 'DirvishArg':              { 'fg': a:spec.diag.warn },
    \ 'DirvishPathTail':         { 'fg': a:spec.syntax.func },
    \ 'DirvishSuffix':           { 'fg': a:spec.fg2 }
  \ }
endfunction
