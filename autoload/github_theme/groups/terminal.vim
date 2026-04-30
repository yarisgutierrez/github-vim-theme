" autoload/github_theme/groups/terminal.vim
" Port of lua/github-theme/group/terminal.lua
"
" Sets Vim's :terminal ansi colors via g:terminal_ansi_colors (Vim) and
" g:terminal_color_* (Neovim, for completeness if anyone runs this there).

function! github_theme#groups#terminal#apply(spec) abort
  let l:p = a:spec.palette

  " Vim's builtin :terminal uses a 16-element list.
  let g:terminal_ansi_colors = [
    \ l:p.black.base,
    \ l:p.red.base,
    \ l:p.green.base,
    \ l:p.yellow.base,
    \ l:p.blue.base,
    \ l:p.magenta.base,
    \ l:p.cyan.base,
    \ l:p.white.base,
    \ l:p.black.bright,
    \ l:p.red.bright,
    \ l:p.green.bright,
    \ l:p.yellow.bright,
    \ l:p.blue.bright,
    \ l:p.magenta.bright,
    \ l:p.cyan.bright,
    \ l:p.white.bright
    \ ]

  " Neovim-style globals (harmless in Vim; helpful if this plugin is
  " inadvertently loaded from a mixed-runtime config).
  let g:terminal_color_0  = l:p.black.base
  let g:terminal_color_8  = l:p.black.bright
  let g:terminal_color_1  = l:p.red.base
  let g:terminal_color_9  = l:p.red.bright
  let g:terminal_color_2  = l:p.green.base
  let g:terminal_color_10 = l:p.green.bright
  let g:terminal_color_3  = l:p.yellow.base
  let g:terminal_color_11 = l:p.yellow.bright
  let g:terminal_color_4  = l:p.blue.base
  let g:terminal_color_12 = l:p.blue.bright
  let g:terminal_color_5  = l:p.magenta.base
  let g:terminal_color_13 = l:p.magenta.bright
  let g:terminal_color_6  = l:p.cyan.base
  let g:terminal_color_14 = l:p.cyan.bright
  let g:terminal_color_7  = l:p.white.base
  let g:terminal_color_15 = l:p.white.bright
endfunction
