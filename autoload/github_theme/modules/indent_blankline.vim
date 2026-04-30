" autoload/github_theme/modules/indent_blankline.vim
" Groups for lukas-reineke/indent-blankline.nvim -- works on Vim via the
" IndentBlankline* highlight names when users manually set them up, plus
" the classic Yggdroot/indentLine group.

function! github_theme#modules#indent_blankline#get(spec, opts) abort
  return {
    \ 'IndentBlanklineChar':        { 'fg': a:spec.bg3, 'style': 'nocombine' },
    \ 'IndentBlanklineSpaceChar':   { 'fg': a:spec.bg3, 'style': 'nocombine' },
    \ 'IndentBlanklineContextChar': { 'fg': a:spec.fg3, 'style': 'nocombine' },
    \ 'IndentBlanklineContextStart':{ 'sp': a:spec.fg3, 'style': 'underline' },
    \ 'IndentLine':                 { 'fg': a:spec.bg3 },
    \ 'IndentLineEven':             { 'fg': a:spec.bg3 },
    \ 'IndentLineOdd':              { 'fg': a:spec.bg2 }
  \ }
endfunction
