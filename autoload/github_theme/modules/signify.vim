" autoload/github_theme/modules/signify.vim
" Groups for mhinz/vim-signify

function! github_theme#modules#signify#get(spec, opts) abort
  return {
    \ 'SignifySignAdd':          { 'fg': a:spec.git.add },
    \ 'SignifySignChange':       { 'fg': a:spec.git.changed },
    \ 'SignifySignDelete':       { 'fg': a:spec.git.removed },
    \ 'SignifySignChangeDelete': { 'fg': a:spec.git.changed },
    \ 'SignifySignDeleteFirstLine': { 'fg': a:spec.git.removed },
    \ 'SignifyLineAdd':          { 'bg': a:spec.diff.add },
    \ 'SignifyLineChange':       { 'bg': a:spec.diff.change },
    \ 'SignifyLineDelete':       { 'bg': a:spec.diff.delete },
    \ 'SignifyLineChangeDelete': { 'bg': a:spec.diff.change }
  \ }
endfunction
