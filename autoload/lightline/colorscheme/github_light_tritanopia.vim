" autoload/lightline/colorscheme/github_light_tritanopia.vim
" Lightline colorscheme for github_light_tritanopia.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_light_tritanopia')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_light_tritanopia#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_light_tritanopia#palette = s:palette
endif
unlet s:palette
