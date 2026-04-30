" autoload/github_theme/modules/tagbar.vim
" Groups for preservim/tagbar

function! github_theme#modules#tagbar#get(spec, opts) abort
  return {
    \ 'TagbarAccessPublic':    { 'fg': a:spec.git.add },
    \ 'TagbarAccessProtected': { 'fg': a:spec.diag.warn },
    \ 'TagbarAccessPrivate':   { 'fg': a:spec.diag.error },
    \ 'TagbarFoldIcon':        { 'fg': a:spec.syntax.func },
    \ 'TagbarHighlight':       { 'fg': a:spec.fg1, 'bg': a:spec.sel0, 'style': 'bold' },
    \ 'TagbarKind':            { 'fg': a:spec.syntax.type },
    \ 'TagbarNestedKind':      { 'fg': a:spec.syntax.type },
    \ 'TagbarScope':           { 'fg': a:spec.syntax.keyword },
    \ 'TagbarSignature':       { 'fg': a:spec.fg2 },
    \ 'TagbarType':            { 'fg': a:spec.syntax.type },
    \ 'TagbarVisibilityPublic':    { 'link': 'TagbarAccessPublic' },
    \ 'TagbarVisibilityProtected': { 'link': 'TagbarAccessProtected' },
    \ 'TagbarVisibilityPrivate':   { 'link': 'TagbarAccessPrivate' }
  \ }
endfunction
