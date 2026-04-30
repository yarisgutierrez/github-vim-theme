" autoload/github_theme/modules/sneak.vim
" Groups for justinmk/vim-sneak

function! github_theme#modules#sneak#get(spec, opts) abort
  return {
    \ 'Sneak':           { 'fg': a:spec.bg1, 'bg': a:spec.diag.info },
    \ 'SneakLabel':      { 'fg': a:spec.bg1, 'bg': a:spec.diag.warn, 'style': 'bold' },
    \ 'SneakScope':      { 'fg': a:spec.fg1, 'bg': a:spec.sel0 }
  \ }
endfunction
