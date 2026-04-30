" autoload/github_theme/palette/github_light_colorblind.vim
" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.
"
" Public API:
"   github_theme#palette#github_light_colorblind#meta() -> {name, light}
"   github_theme#palette#github_light_colorblind#get()  -> palette dict
"   github_theme#palette#github_light_colorblind#spec() -> spec dict (includes .palette)

function! github_theme#palette#github_light_colorblind#meta() abort
  return {
    \ 'name': 'github_light_colorblind',
    \ 'light': v:true
  \ }
endfunction

function! github_theme#palette#github_light_colorblind#get() abort
  return {
    \ 'orange': '#f79939',
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
      \ 'base': '#b35900',
      \ 'bright': '#8a4600'
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
      \ 'fg': '#b35900',
      \ 'emphasis': '#b35900',
      \ 'muted': '#fcd6b0',
      \ 'subtle': '#fff5e8'
    \ },
    \ 'danger': {
      \ 'fg': '#d1242f',
      \ 'emphasis': '#b35900',
      \ 'muted': '#fcd6b0',
      \ 'subtle': '#fff5e8'
    \ },
    \ 'open': {
      \ 'fg': '#0969da',
      \ 'emphasis': '#1f883d',
      \ 'muted': '#bbdfff',
      \ 'subtle': '#ddf4ff'
    \ },
    \ 'closed': {
      \ 'fg': '#d1242f',
      \ 'emphasis': '#b35900',
      \ 'muted': '#fcd6b0',
      \ 'subtle': '#fff5e8'
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
      \ 'orange': ['#fff5e8', '#ffddb0', '#ffbc6d', '#f79939', '#dd7815', '#b35900', '#8a4600', '#6f3800', '#572c00', '#412000'],
      \ 'red': ['#fff5e8', '#ffddb0', '#ffbc6d', '#f79939', '#dd7815', '#b35900', '#8a4600', '#6f3800', '#572c00', '#412000'],
      \ 'purple': ['#fbefff', '#ecd8ff', '#d8b9ff', '#c297ff', '#a475f9', '#8250df', '#6639ba', '#512a97', '#3e1f79', '#2e1461'],
      \ 'pink': ['#ffeff7', '#ffd3eb', '#ffadda', '#ff80c8', '#e85aad', '#bf3989', '#99286e', '#772057', '#611347', '#4d0336'],
      \ 'coral': ['#fff0eb', '#ffd6cc', '#ffb4a1', '#fd8c73', '#ec6547', '#c4432b', '#9e2f1c', '#801f0f', '#691105', '#510901']
    \ }
  \ }
endfunction

function! github_theme#palette#github_light_colorblind#spec() abort
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
      \ 'builtin1': '#b35900',
      \ 'builtin2': '#0550ae',
      \ 'comment': '#57606a',
      \ 'conditional': '#b35900',
      \ 'const': '#0550ae',
      \ 'dep': '#6f3800',
      \ 'field': '#0550ae',
      \ 'func': '#6639ba',
      \ 'ident': '#1b1f24',
      \ 'keyword': '#b35900',
      \ 'number': '#0550ae',
      \ 'operator': '#0550ae',
      \ 'param': '#1b1f24',
      \ 'preproc': '#b35900',
      \ 'regex': '#0a3069',
      \ 'statement': '#b35900',
      \ 'string': '#0a3069',
      \ 'type': '#8a4600',
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
      \ 'delete': '#dcc8b2',
      \ 'change': '#d8cab2',
      \ 'text': '#6e7781'
    \ },
    \ 'git': {
      \ 'add': '#0969da',
      \ 'removed': '#d1242f',
      \ 'changed': '#9a6700',
      \ 'conflict': '#b35900',
      \ 'ignored': '#6e7781'
    \ }
  \ }
  let l:spec.palette = github_theme#palette#github_light_colorblind#get()
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
