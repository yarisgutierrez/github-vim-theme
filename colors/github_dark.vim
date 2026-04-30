" colors/github_dark.vim
" Part of github-vim-theme.
" Vim port of projekt0n/github-nvim-theme — github_dark variant.

if !has('gui_running') && &t_Co < 256 && !has('termguicolors')
  echohl WarningMsg
  echom 'github-theme: terminal lacks 256-color support; theme may look wrong.'
  echohl None
endif

if !has('termguicolors') && !has('gui_running')
  " Theme is designed for true color; warn but continue with cterm fallback.
endif

let g:colors_name = 'github_dark'
call github_theme#theme#apply('github_dark')
