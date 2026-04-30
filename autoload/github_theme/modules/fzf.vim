" autoload/github_theme/modules/fzf.vim
" Groups for junegunn/fzf.vim
"
" Sets g:fzf_colors so fzf itself uses matching ANSI colors, and defines
" fzf-related highlight groups for the embedded popup.

function! github_theme#modules#fzf#get(spec, opts) abort
  let l:c = a:spec.palette

  " fzf's $FZF_DEFAULT_OPTS color map via g:fzf_colors.
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Constant'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment']
    \ }

  return {
    \ 'fzf1':             { 'fg': l:c.red.base,   'bg': a:spec.bg1 },
    \ 'fzf2':             { 'fg': l:c.green.base, 'bg': a:spec.bg1 },
    \ 'fzf3':             { 'fg': l:c.yellow.base,'bg': a:spec.bg1 },
    \ 'fzfNormal':        { 'fg': a:spec.fg2 },
    \ 'fzfBorder':        { 'fg': l:c.border.default },
    \ 'fzfFgPlus':        { 'fg': a:spec.fg1 },
    \ 'fzfBgPlus':        { 'bg': a:spec.sel0 },
    \ 'fzfMatch':         { 'fg': a:spec.syntax.string, 'style': 'bold' }
  \ }
endfunction
