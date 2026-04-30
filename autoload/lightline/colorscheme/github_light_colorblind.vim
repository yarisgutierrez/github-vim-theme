" autoload/lightline/colorscheme/github_light_colorblind.vim
" Lightline colorscheme for github_light_colorblind.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_light_colorblind')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_light_colorblind#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_light_colorblind#palette = s:palette
endif
unlet s:palette
