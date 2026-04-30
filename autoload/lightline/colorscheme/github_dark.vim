" autoload/lightline/colorscheme/github_dark.vim
" Lightline colorscheme for github_dark.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_dark')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_dark#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_dark#palette = s:palette
endif
unlet s:palette
