" autoload/lightline/colorscheme/github_dark_colorblind.vim
" Lightline colorscheme for github_dark_colorblind.
" Part of github-vim-theme.

let s:palette = github_theme#lightline#build('github_dark_colorblind')
if exists('*lightline#colorscheme#fill')
  let g:lightline#colorscheme#github_dark_colorblind#palette = lightline#colorscheme#fill(s:palette)
else
  let g:lightline#colorscheme#github_dark_colorblind#palette = s:palette
endif
unlet s:palette
