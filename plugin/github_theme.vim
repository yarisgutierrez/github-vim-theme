" plugin/github_theme.vim
" github-vim-theme — main plugin entry point.
"
" Defines user commands and utility autocmds. The actual theme logic lives
" under autoload/, loaded lazily.

if exists('g:loaded_github_theme') && g:loaded_github_theme
  finish
endif
let g:loaded_github_theme = 1

" :GithubThemeReload [<theme>]
"
" Re-applies the currently active github-theme (or the given one). Useful
" after editing g:github_theme_config at runtime, or when iterating on
" palette/spec/group overrides.
"
" Without an argument, reloads the last-applied theme (tracked via
" g:github_theme_last_applied, which is set by github_theme#theme#apply()).
" Falls back to g:colors_name if it looks like a github-theme.
command! -nargs=? -complete=customlist,s:theme_complete GithubThemeReload
  \ call s:reload(<q-args>)

function! s:reload(arg) abort
  let l:target = ''
  if !empty(a:arg)
    let l:target = a:arg
  elseif exists('g:github_theme_last_applied')
    let l:target = g:github_theme_last_applied
  elseif exists('g:colors_name') && g:colors_name =~# '^github_'
    let l:target = g:colors_name
  endif
  if empty(l:target)
    echohl ErrorMsg
    echom 'GithubThemeReload: no github theme currently active; pass a name.'
    echohl None
    return
  endif
  if index(github_theme#palette#themes(), l:target) < 0
    echohl ErrorMsg
    echom 'GithubThemeReload: unknown theme: ' . l:target
    echohl None
    return
  endif
  execute 'colorscheme ' . l:target
  echom 'github-theme: reloaded ' . l:target
endfunction

function! s:theme_complete(arglead, cmdline, cursorpos) abort
  return filter(github_theme#palette#themes(), 'v:val =~# "^" . a:arglead')
endfunction

" :GithubThemeInfo
"
" Prints the name of the currently applied theme plus key spec values
" (useful for debugging overrides).
command! GithubThemeInfo call s:info()

function! s:info() abort
  if !exists('g:github_theme_last_applied')
    echo 'github-theme: no theme applied in this session.'
    return
  endif
  let l:t = g:github_theme_last_applied
  let l:spec = github_theme#spec#load(l:t)
  echo 'github-theme: active = ' . l:t
  echo '  bg1:       ' . l:spec.bg1
  echo '  fg1:       ' . l:spec.fg1
  echo '  accent.fg: ' . l:spec.palette.accent.fg
  echo '  transparent: ' . string(get(github_theme#config#options(), 'transparent', v:false))
endfunction
