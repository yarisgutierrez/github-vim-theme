" autoload/github_theme/modules/ale.vim
" Groups for dense-analysis/ale

function! github_theme#modules#ale#get(spec, opts) abort
  return {
    \ 'ALEErrorSign':         { 'fg': a:spec.diag.error },
    \ 'ALEWarningSign':       { 'fg': a:spec.diag.warn },
    \ 'ALEInfoSign':          { 'fg': a:spec.diag.info },
    \ 'ALEStyleErrorSign':    { 'fg': a:spec.diag.error },
    \ 'ALEStyleWarningSign':  { 'fg': a:spec.diag.warn },
    \ 'ALEVirtualTextError':  { 'fg': a:spec.diag.error, 'style': 'italic' },
    \ 'ALEVirtualTextWarning':{ 'fg': a:spec.diag.warn,  'style': 'italic' },
    \ 'ALEVirtualTextInfo':   { 'fg': a:spec.diag.info,  'style': 'italic' },
    \ 'ALEError':             { 'sp': a:spec.diag.error, 'style': 'undercurl' },
    \ 'ALEWarning':           { 'sp': a:spec.diag.warn,  'style': 'undercurl' },
    \ 'ALEInfo':              { 'sp': a:spec.diag.info,  'style': 'undercurl' },
    \ 'ALEErrorLine':         { 'bg': a:spec.diag_bg.error },
    \ 'ALEWarningLine':       { 'bg': a:spec.diag_bg.warn },
    \ 'ALEInfoLine':          { 'bg': a:spec.diag_bg.info }
  \ }
endfunction
