" autoload/github_theme/modules/gitgutter.vim
" Groups for airblade/vim-gitgutter

function! github_theme#modules#gitgutter#get(spec, opts) abort
  return {
    \ 'GitGutterAdd':                { 'fg': a:spec.git.add },
    \ 'GitGutterChange':             { 'fg': a:spec.git.changed },
    \ 'GitGutterDelete':             { 'fg': a:spec.git.removed },
    \ 'GitGutterChangeDelete':       { 'fg': a:spec.git.changed },
    \ 'GitGutterAddLine':            { 'bg': a:spec.diff.add },
    \ 'GitGutterChangeLine':         { 'bg': a:spec.diff.change },
    \ 'GitGutterDeleteLine':         { 'bg': a:spec.diff.delete },
    \ 'GitGutterChangeDeleteLine':   { 'bg': a:spec.diff.change },
    \ 'GitGutterAddLineNr':          { 'fg': a:spec.git.add },
    \ 'GitGutterChangeLineNr':       { 'fg': a:spec.git.changed },
    \ 'GitGutterDeleteLineNr':       { 'fg': a:spec.git.removed },
    \ 'GitGutterChangeDeleteLineNr': { 'fg': a:spec.git.changed }
  \ }
endfunction
