" autoload/lightline/colorscheme/github_dark_dimmed.vim
" Lightline colorscheme for github_dark_dimmed.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_dark_dimmed')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_dark_dimmed#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_dark_dimmed#palette = s:palette
endif
unlet s:palette
