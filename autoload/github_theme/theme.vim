" autoload/github_theme/theme.vim
" Main entry point: load a spec, collect all group dicts, apply user
" overrides, emit :highlight commands.
"
" Public API:
"   github_theme#theme#apply(name)    load and apply a colorscheme by name
"
" This is the function each colors/<name>.vim file calls.

let s:module_names = [
  \ 'ale',
  \ 'coc',
  \ 'gitgutter',
  \ 'signify',
  \ 'nerdtree',
  \ 'fzf',
  \ 'syntastic',
  \ 'tagbar',
  \ 'indent_blankline',
  \ 'dirvish',
  \ 'sneak',
  \ 'floaterm'
  \ ]

" Emit a one-shot warning if the terminal lacks 256-color and true-color
" support. Idempotent: only fires once per Vim session.
function! s:warn_capabilities() abort
  if get(g:, 'github_theme_capabilities_warned', 0)
    return
  endif
  let g:github_theme_capabilities_warned = 1
  if !has('gui_running') && &t_Co < 256 && !has('termguicolors')
    echohl WarningMsg
    echom 'github-theme: terminal lacks 256-color support; theme may look wrong.'
    echohl None
  endif
endfunction

" Reset vim's highlight state in the order Vim's documented contract requires.
"
" Per :help highlight-clear: "Uses the current value of 'background' to
" decide which default colors to use." So `:set background` MUST come before
" `:hi clear`, or any group we don't explicitly overwrite ends up painted
" with the opposite-mode defaults.
"
" DO NOT reorder the body of this function.
function! s:reset_state(is_light) abort
  let &background = a:is_light ? 'light' : 'dark'
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endfunction

function! github_theme#theme#apply(name) abort
  call s:warn_capabilities()

  let l:cfg  = github_theme#config#get()
  let l:opts = l:cfg.options
  let l:spec = github_theme#spec#load(a:name)

  let l:meta = call('github_theme#palette#' . a:name . '#meta', [])
  call s:reset_state(get(l:meta, 'light', v:false))

  let l:groups = {}
  call extend(l:groups, github_theme#groups#editor#get(l:spec, l:opts))
  call extend(l:groups, github_theme#groups#syntax#get(l:spec, l:opts))

  " Modules — only include enabled ones.
  "
  " Use call() (the builtin) for dynamic dispatch. Unlike function(), call()
  " resolves the name at call-time, which triggers autoload of the target
  " file. See :help call() and :help autoload.
  for l:m in s:module_names
    if !github_theme#config#module_enabled(l:m)
      continue
    endif
    let l:mod_groups = {}
    try
      let l:mod_groups = call('github_theme#modules#' . l:m . '#get', [l:spec, l:opts])
    catch /E117\|E130/
      " Module function not defined; skip silently.
      continue
    endtry
    if type(l:mod_groups) == type({})
      call extend(l:groups, l:mod_groups)
    endif
  endfor

  " Apply user group overrides (groups.all + groups.<name>).
  let l:groups = github_theme#collect#apply_overrides(
    \ l:groups, get(l:cfg, 'groups', {}), a:name)

  " Flush to :highlight commands.
  call github_theme#highlight#apply(l:groups)

  " Terminal colors (if enabled).
  if get(l:opts, 'terminal_colors', v:true)
    call github_theme#groups#terminal#apply(l:spec)
  endif

  let g:colors_name = a:name
  let g:github_theme_last_applied = a:name
endfunction
