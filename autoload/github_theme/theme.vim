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

function! github_theme#theme#apply(name) abort
  let l:cfg  = github_theme#config#get()
  let l:opts = l:cfg.options
  let l:spec = github_theme#spec#load(a:name)

  " Reset any prior colorscheme state cleanly.
  "
  " Order matters: `set background` implicitly re-initializes vim's default
  " highlight groups. If we do `highlight clear` before `set background`,
  " vim re-populates many groups with its defaults and our later per-group
  " work only overwrites the ones we explicitly define — leaving the rest
  " painted with the opposite-mode defaults. So: set background FIRST, then
  " clear, then reset syntax, then apply our groups.
  let l:meta = function('github_theme#palette#' . a:name . '#meta')()
  if get(l:meta, 'light', v:false)
    set background=light
  else
    set background=dark
  endif
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif

  let l:groups = {}
  call extend(l:groups, github_theme#groups#editor#get(l:spec, l:opts))
  call extend(l:groups, github_theme#groups#syntax#get(l:spec, l:opts))

  " Modules — only include enabled ones.
  for l:m in s:module_names
    if !github_theme#config#module_enabled(l:m)
      continue
    endif
    " Force the autoload file to be sourced by calling the function
    " indirectly via execute — `function()` alone won't trigger autoload
    " for a not-yet-sourced file.
    let l:mod_groups = {}
    try
      execute 'let l:mod_groups = github_theme#modules#' . l:m . '#get(l:spec, l:opts)'
    catch /E117\|E130/
      " Module function not defined; skip silently.
      continue
    endtry
    if type(l:mod_groups) == type({})
      call extend(l:groups, l:mod_groups)
    endif
  endfor

  " Apply user group overrides (groups.all + groups.<name>)
  let l:user_groups = get(l:cfg, 'groups', {})
  if type(l:user_groups) == type({}) && !empty(l:user_groups)
    let l:all      = get(l:user_groups, 'all', {})
    let l:specific = get(l:user_groups, a:name, {})
    let l:groups = github_theme#collect#deep_extend(l:groups, l:all, l:specific)
  endif

  " Flush to :highlight commands.
  call github_theme#highlight#apply(l:groups)

  " Terminal colors (if enabled).
  if get(l:opts, 'terminal_colors', v:true)
    call github_theme#groups#terminal#apply(l:spec)
  endif

  let g:colors_name = a:name
  let g:github_theme_last_applied = a:name
endfunction
