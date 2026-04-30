" autoload/lightline/colorscheme/github_dark_default.vim
" Lightline colorscheme for github_dark_default.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_dark_default')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_dark_default#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_dark_default#palette = s:palette
endif
unlet s:palette
