" autoload/github_theme/modules/coc.vim
" Groups for neoclide/coc.nvim (usable from Vim as well).

function! github_theme#modules#coc#get(spec, opts) abort
  let l:g = {
    \ 'CocErrorSign':       { 'fg': a:spec.diag.error },
    \ 'CocWarningSign':     { 'fg': a:spec.diag.warn },
    \ 'CocInfoSign':        { 'fg': a:spec.diag.info },
    \ 'CocHintSign':        { 'fg': a:spec.diag.hint },
    \ 'CocErrorFloat':      { 'fg': a:spec.diag.error, 'bg': a:spec.bg0 },
    \ 'CocWarningFloat':    { 'fg': a:spec.diag.warn,  'bg': a:spec.bg0 },
    \ 'CocInfoFloat':       { 'fg': a:spec.diag.info,  'bg': a:spec.bg0 },
    \ 'CocHintFloat':       { 'fg': a:spec.diag.hint,  'bg': a:spec.bg0 },
    \ 'CocErrorHighlight':  { 'sp': a:spec.diag.error, 'style': 'undercurl' },
    \ 'CocWarningHighlight':{ 'sp': a:spec.diag.warn,  'style': 'undercurl' },
    \ 'CocInfoHighlight':   { 'sp': a:spec.diag.info,  'style': 'undercurl' },
    \ 'CocHintHighlight':   { 'sp': a:spec.diag.hint,  'style': 'undercurl' },
    \ 'CocSelectedText':    { 'fg': a:spec.fg1, 'bg': a:spec.sel0 },
    \ 'CocMenuSel':         { 'bg': a:spec.sel1 },
    \ 'CocListMode':        { 'fg': a:spec.fg0, 'bg': a:spec.bg0 },
    \ 'CocListPath':        { 'fg': a:spec.fg0, 'bg': a:spec.bg0 },
    \ 'CocHighlightText':   { 'bg': a:spec.sel0 },
    \ 'CocSearch':          { 'fg': a:spec.diag.info, 'style': 'bold' },
    \ 'CocMarkdownLink':    { 'fg': a:spec.syntax.func, 'style': 'underline' },
    \ 'CocGitAddedSign':    { 'fg': a:spec.git.add },
    \ 'CocGitChangedSign':  { 'fg': a:spec.git.changed },
    \ 'CocGitRemovedSign':  { 'fg': a:spec.git.removed },
    \ 'CocGitTopRemovedSign': { 'fg': a:spec.git.removed },
    \ 'CocGitChangeRemovedSign': { 'fg': a:spec.git.changed },
    \ 'CocSymbolFunction':  { 'fg': a:spec.syntax.func },
    \ 'CocSymbolVariable':  { 'fg': a:spec.syntax.variable },
    \ 'CocSymbolClass':     { 'fg': a:spec.syntax.type },
    \ 'CocSymbolKeyword':   { 'fg': a:spec.syntax.keyword },
    \ 'CocSymbolString':    { 'fg': a:spec.syntax.string }
    \ }

  let l:cfg = get(get(a:opts, 'modules', {}), 'coc', {})
  if type(l:cfg) == type({}) && get(l:cfg, 'background', v:true)
    let l:g.CocErrorVirtualText   = { 'fg': a:spec.diag.error, 'bg': a:spec.diag_bg.error }
    let l:g.CocWarningVirtualText = { 'fg': a:spec.diag.warn,  'bg': a:spec.diag_bg.warn }
    let l:g.CocInfoVirtualText    = { 'fg': a:spec.diag.info,  'bg': a:spec.diag_bg.info }
    let l:g.CocHintVirtualText    = { 'fg': a:spec.diag.hint,  'bg': a:spec.diag_bg.hint }
  else
    let l:g.CocErrorVirtualText   = { 'fg': a:spec.diag.error, 'style': 'italic' }
    let l:g.CocWarningVirtualText = { 'fg': a:spec.diag.warn,  'style': 'italic' }
    let l:g.CocInfoVirtualText    = { 'fg': a:spec.diag.info,  'style': 'italic' }
    let l:g.CocHintVirtualText    = { 'fg': a:spec.diag.hint,  'style': 'italic' }
  endif
  return l:g
endfunction
