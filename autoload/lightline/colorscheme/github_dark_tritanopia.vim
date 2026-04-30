" autoload/lightline/colorscheme/github_dark_tritanopia.vim
" Lightline colorscheme for github_dark_tritanopia.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_dark_tritanopia')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_dark_tritanopia#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_dark_tritanopia#palette = s:palette
endif
unlet s:palette
