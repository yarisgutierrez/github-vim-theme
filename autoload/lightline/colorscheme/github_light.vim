" autoload/lightline/colorscheme/github_light.vim
" Lightline colorscheme for github_light.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_light')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_light#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_light#palette = s:palette
endif
unlet s:palette
