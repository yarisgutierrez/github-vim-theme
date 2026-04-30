" autoload/lightline/colorscheme/github_light_high_contrast.vim
" Lightline colorscheme for github_light_high_contrast.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_light_high_contrast')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_light_high_contrast#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_light_high_contrast#palette = s:palette
endif
unlet s:palette
