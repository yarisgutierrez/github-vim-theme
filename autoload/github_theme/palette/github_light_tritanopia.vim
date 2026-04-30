" autoload/github_theme/palette/github_light_tritanopia.vim
" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.
"
" Public API:
"   github_theme#palette#github_light_tritanopia#meta() -> {name, light}
"   github_theme#palette#github_light_tritanopia#get()  -> palette dict
"   github_theme#palette#github_light_tritanopia#spec() -> spec dict (includes .palette)

function! github_theme#palette#github_light_tritanopia#meta() abort
  return {
    \ 'name': 'github_light_tritanopia',
    \ 'light': v:true
  \ }
endfunction

function! github_theme#palette#github_light_tritanopia#get() abort
  return {
    \ 'orange': '#ff8182',
    \ 'gray': '#6e7781',
    \ 'black': {
      \ 'base': '#24292f',
      \ 'bright': '#57606a'
    \ },
    \ 'white': {
      \ 'base': '#6e7781',
      \ 'bright': '#8c959f'
    \ },
    \ 'red': {
      \ 'base': '#cf222e',
      \ 'bright': '#a40e26'
    \ },
    \ 'green': {
      \ 'base': '#0550ae',
      \ 'bright': '#0969da'
    \ },
    \ 'yellow': {
      \ 'base': '#4d2d00',
      \ 'bright': '#633c01'
    \ },
    \ 'blue': {
      \ 'base': '#0969da',
      \ 'bright': '#218bff'
    \ },
    \ 'magenta': {
      \ 'base': '#8250df',
      \ 'bright': '#a475f9'
    \ },
    \ 'pink': {
      \ 'base': '#bf3989',
      \ 'bright': '#e85aad'
    \ },
    \ 'cyan': {
      \ 'base': '#1b7c83',
      \ 'bright': '#3192aa'
    \ },
    \ 'fg': {
      \ 'default': '#1b1f24',
      \ 'muted': '#d0d7de',
      \ 'subtle': '#6e7781',
      \ 'on_emphasis': '#ffffff'
    \ },
    \ 'canvas': {
      \ 'default': '#ffffff',
      \ 'overlay': '#ffffff',
      \ 'inset': '#f6f8fa',
      \ 'subtle': '#f6f8fa'
    \ },
    \ 'border': {
      \ 'default': '#d0d7de',
      \ 'muted': '#d0d7de',
      \ 'subtle': '#ddddde'
    \ },
    \ 'neutral': {
      \ 'emphasis_plus': '#24292f',
      \ 'emphasis': '#6e7781',
      \ 'muted': '#eff1f3',
      \ 'subtle': '#f4f6f8'
    \ },
    \ 'accent': {
      \ 'fg': '#0969da',
      \ 'emphasis': '#0969da',
      \ 'muted': '#bbdfff',
      \ 'subtle': '#ddf4ff'
    \ },
    \ 'success': {
      \ 'fg': '#0969da',
      \ 'emphasis': '#1f883d',
      \ 'muted': '#bbdfff',
      \ 'subtle': '#ddf4ff'
    \ },
    \ 'attention': {
      \ 'fg': '#9a6700',
      \ 'emphasis': '#9a6700',
      \ 'muted': '#eedcab',
      \ 'subtle': '#fff8c5'
    \ },
    \ 'severe': {
      \ 'fg': '#cf222e',
      \ 'emphasis': '#cf222e',
      \ 'muted': '#ffcdcd',
      \ 'subtle': '#ffebe9'
    \ },
    \ 'danger': {
      \ 'fg': '#d1242f',
      \ 'emphasis': '#cf222e',
      \ 'muted': '#ffcdcd',
      \ 'subtle': '#ffebe9'
    \ },
    \ 'open': {
      \ 'fg': '#0969da',
      \ 'emphasis': '#1f883d',
      \ 'muted': '#bbdfff',
      \ 'subtle': '#ddf4ff'
    \ },
    \ 'closed': {
      \ 'fg': '#d1242f',
      \ 'emphasis': '#cf222e',
      \ 'muted': '#ffcdcd',
      \ 'subtle': '#ffebe9'
    \ },
    \ 'done': {
      \ 'fg': '#8250df',
      \ 'emphasis': '#8250df',
      \ 'muted': '#e7d5ff',
      \ 'subtle': '#fbefff'
    \ },
    \ 'sponsors': {
      \ 'fg': '#bf3989',
      \ 'emphasis': '#bf3989',
      \ 'muted': '#ffcce9',
      \ 'subtle': '#ffeff7'
    \ },
    \ 'scale': {
      \ 'black': '#1b1f24',
      \ 'white': '#ffffff',
      \ 'gray': ['#f6f8fa', '#eaeef2', '#d0d7de', '#afb8c1', '#8c959f', '#6e7781', '#57606a', '#424a53', '#32383f', '#24292f'],
      \ 'blue': ['#ddf4ff', '#b6e3ff', '#80ccff', '#54aeff', '#218bff', '#0969da', '#0550ae', '#033d8b', '#0a3069', '#002155'],
      \ 'green': ['#ddf4ff', '#b6e3ff', '#80ccff', '#54aeff', '#218bff', '#0969da', '#0550ae', '#033d8b', '#0a3069', '#002155'],
      \ 'yellow': ['#fff8c5', '#fae17d', '#eac54f', '#d4a72c', '#bf8700', '#9a6700', '#7d4e00', '#633c01', '#4d2d00', '#3b2300'],
      \ 'orange': ['#ffebe9', '#ffcecb', '#ffaba8', '#ff8182', '#fa4549', '#cf222e', '#a40e26', '#82071e', '#660018', '#4c0014'],
      \ 'red': ['#ffebe9', '#ffcecb', '#ffaba8', '#ff8182', '#fa4549', '#cf222e', '#a40e26', '#82071e', '#660018', '#4c0014'],
      \ 'purple': ['#fbefff', '#ecd8ff', '#d8b9ff', '#c297ff', '#a475f9', '#8250df', '#6639ba', '#512a97', '#3e1f79', '#2e1461'],
      \ 'pink': ['#ffeff7', '#ffd3eb', '#ffadda', '#ff80c8', '#e85aad', '#bf3989', '#99286e', '#772057', '#611347', '#4d0336'],
      \ 'coral': ['#fff0eb', '#ffd6cc', '#ffb4a1', '#fd8c73', '#ec6547', '#c4432b', '#9e2f1c', '#801f0f', '#691105', '#510901']
    \ }
  \ }
endfunction

function! github_theme#palette#github_light_tritanopia#spec() abort
  let l:spec = {
    \ 'bg0': '#f6f8fa',
    \ 'bg1': '#ffffff',
    \ 'bg2': '#f0f1f2',
    \ 'bg3': '#e6eaf0',
    \ 'bg4': '#6e7781',
    \ 'fg0': '#6e7781',
    \ 'fg1': '#1b1f24',
    \ 'fg2': '#32383f',
    \ 'fg3': '#57606a',
    \ 'sel0': '#dae8f9',
    \ 'sel1': '#c2e2ff',
    \ 'sel2': '#e1d1b2',
    \ 'syntax': {
      \ 'bracket': '#1b1f24',
      \ 'builtin0': '#0550ae',
      \ 'builtin1': '#cf222e',
      \ 'builtin2': '#0550ae',
      \ 'comment': '#57606a',
      \ 'conditional': '#cf222e',
      \ 'const': '#0550ae',
      \ 'dep': '#82071e',
      \ 'field': '#0550ae',
      \ 'func': '#6639ba',
      \ 'ident': '#1b1f24',
      \ 'keyword': '#cf222e',
      \ 'number': '#0550ae',
      \ 'operator': '#0550ae',
      \ 'param': '#1b1f24',
      \ 'preproc': '#cf222e',
      \ 'regex': '#0a3069',
      \ 'statement': '#cf222e',
      \ 'string': '#0a3069',
      \ 'type': '#a40e26',
      \ 'tag': '#0550ae',
      \ 'variable': '#1b1f24'
    \ },
    \ 'diag': {
      \ 'error': '#d1242f',
      \ 'warn': '#9a6700',
      \ 'info': '#0969da',
      \ 'hint': '#d0d7de'
    \ },
    \ 'diag_bg': {
      \ 'error': '#f8dee0',
      \ 'warn': '#f0e8d9',
      \ 'info': '#dae8f9',
      \ 'hint': '#f8f9fa'
    \ },
    \ 'diff': {
      \ 'add': '#b4cae7',
      \ 'delete': '#e4b7be',
      \ 'change': '#d8cab2',
      \ 'text': '#6e7781'
    \ },
    \ 'git': {
      \ 'add': '#0969da',
      \ 'removed': '#d1242f',
      \ 'changed': '#9a6700',
      \ 'conflict': '#cf222e',
      \ 'ignored': '#6e7781'
    \ }
  \ }
  let l:spec.palette = github_theme#palette#github_light_tritanopia#get()
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
