" autoload/github_theme/palette/github_dark_colorblind.vim
" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.
"
" Public API:
"   github_theme#palette#github_dark_colorblind#meta() -> {name, light}
"   github_theme#palette#github_dark_colorblind#get()  -> palette dict
"   github_theme#palette#github_dark_colorblind#spec() -> spec dict (includes .palette)

function! github_theme#palette#github_dark_colorblind#meta() abort
  return {
    \ 'name': 'github_dark_colorblind',
    \ 'light': v:false
  \ }
endfunction

function! github_theme#palette#github_dark_colorblind#get() abort
  return {
    \ 'orange': '#ec8e2c',
    \ 'black': {
      \ 'base': '#0d1117',
      \ 'bright': '#161b22'
    \ },
    \ 'gray': {
      \ 'base': '#6e7681',
      \ 'bright': '#6e7681'
    \ },
    \ 'blue': {
      \ 'base': '#58a6ff',
      \ 'bright': '#79c0ff'
    \ },
    \ 'green': {
      \ 'base': '#58a6ff',
      \ 'bright': '#79c0ff'
    \ },
    \ 'magenta': {
      \ 'base': '#bc8cff',
      \ 'bright': '#d2a8ff'
    \ },
    \ 'pink': {
      \ 'base': '#f778ba',
      \ 'bright': '#ff9bce'
    \ },
    \ 'red': {
      \ 'base': '#ec8e2c',
      \ 'bright': '#fdac54'
    \ },
    \ 'white': {
      \ 'base': '#b1bac4',
      \ 'bright': '#b1bac4'
    \ },
    \ 'yellow': {
      \ 'base': '#d29922',
      \ 'bright': '#e3b341'
    \ },
    \ 'cyan': {
      \ 'base': '#76e3ea',
      \ 'bright': '#b3f0ff'
    \ },
    \ 'fg': {
      \ 'default': '#e6edf3',
      \ 'muted': '#7d8590',
      \ 'subtle': '#6e7681',
      \ 'on_emphasis': '#ffffff'
    \ },
    \ 'canvas': {
      \ 'default': '#0d1117',
      \ 'overlay': '#161b22',
      \ 'inset': '#010409',
      \ 'subtle': '#161b22'
    \ },
    \ 'border': {
      \ 'default': '#161b22',
      \ 'muted': '#21262d',
      \ 'subtle': '#24282e'
    \ },
    \ 'neutral': {
      \ 'emphasis_plus': '#6e7681',
      \ 'emphasis': '#6e7681',
      \ 'muted': '#343941',
      \ 'subtle': '#171b22'
    \ },
    \ 'accent': {
      \ 'fg': '#2f81f7',
      \ 'emphasis': '#1f6feb',
      \ 'muted': '#1e4273',
      \ 'subtle': '#13233a'
    \ },
    \ 'success': {
      \ 'fg': '#58a6ff',
      \ 'emphasis': '#1f6feb',
      \ 'muted': '#1a4a29',
      \ 'subtle': '#12261e'
    \ },
    \ 'attention': {
      \ 'fg': '#d29922',
      \ 'emphasis': '#9e6a03',
      \ 'muted': '#533d11',
      \ 'subtle': '#272215'
    \ },
    \ 'severe': {
      \ 'fg': '#d47616',
      \ 'emphasis': '#b76100',
      \ 'muted': '#5f361e',
      \ 'subtle': '#221a19'
    \ },
    \ 'danger': {
      \ 'fg': '#d47616',
      \ 'emphasis': '#b76100',
      \ 'muted': '#6b2b2b',
      \ 'subtle': '#24171c'
    \ },
    \ 'open': {
      \ 'fg': '#58a6ff',
      \ 'emphasis': '#1f6feb',
      \ 'muted': '#1a4a29',
      \ 'subtle': '#12261e'
    \ },
    \ 'done': {
      \ 'fg': '#a371f7',
      \ 'emphasis': '#8957e5',
      \ 'muted': '#493771',
      \ 'subtle': '#1c1b2d'
    \ },
    \ 'closed': {
      \ 'fg': '#d47616',
      \ 'emphasis': '#b76100',
      \ 'muted': '#6b2b2b',
      \ 'subtle': '#301b1e'
    \ },
    \ 'sponsors': {
      \ 'fg': '#db61a2',
      \ 'emphasis': '#bf4b8a',
      \ 'muted': '#5f314f',
      \ 'subtle': '#221925'
    \ },
    \ 'scale': {
      \ 'black': '#010409',
      \ 'white': '#ffffff',
      \ 'gray': ['#f0f6fc', '#c9d1d9', '#b1bac4', '#8b949e', '#6e7681', '#484f58', '#30363d', '#21262d', '#161b22', '#0d1117'],
      \ 'blue': ['#cae8ff', '#a5d6ff', '#79c0ff', '#58a6ff', '#388bfd', '#1f6feb', '#1158c7', '#0d419d', '#0c2d6b', '#051d4d'],
      \ 'green': ['#cae8ff', '#a5d6ff', '#79c0ff', '#58a6ff', '#388bfd', '#1f6feb', '#1158c7', '#0d419d', '#0c2d6b', '#051d4d'],
      \ 'yellow': ['#f8e3a1', '#f2cc60', '#e3b341', '#d29922', '#bb8009', '#9e6a03', '#845306', '#693e00', '#4b2900', '#341a00'],
      \ 'orange': ['#ffe2bb', '#ffc981', '#fdac54', '#ec8e2c', '#d47616', '#b76100', '#914d04', '#6c3906', '#4e2906', '#331c04'],
      \ 'red': ['#ffe2bb', '#ffc981', '#fdac54', '#ec8e2c', '#d47616', '#b76100', '#914d04', '#6c3906', '#4e2906', '#331c04'],
      \ 'purple': ['#eddeff', '#e2c5ff', '#d2a8ff', '#bc8cff', '#a371f7', '#8957e5', '#6e40c9', '#553098', '#3c1e70', '#271052'],
      \ 'pink': ['#ffdaec', '#ffbedd', '#ff9bce', '#f778ba', '#db61a2', '#bf4b8a', '#9e3670', '#7d2457', '#5e103e', '#42062a'],
      \ 'coral': ['#ffddd2', '#ffc2b2', '#ffa28b', '#f78166', '#ea6045', '#cf462d', '#ac3220', '#872012', '#640d04', '#460701']
    \ }
  \ }
endfunction

function! github_theme#palette#github_dark_colorblind#spec() abort
  let l:spec = {
    \ 'bg0': '#04070c',
    \ 'bg1': '#0d1117',
    \ 'bg2': '#171b22',
    \ 'bg3': '#484f58',
    \ 'bg4': '#8b949e',
    \ 'fg0': '#6e7681',
    \ 'fg1': '#e6edf3',
    \ 'fg2': '#7d8590',
    \ 'fg3': '#6e7681',
    \ 'sel0': '#17335a',
    \ 'sel1': '#1c3d6a',
    \ 'sel2': '#3c3b33',
    \ 'syntax': {
      \ 'bracket': '#e6edf3',
      \ 'builtin0': '#79c0ff',
      \ 'builtin1': '#ec8e2c',
      \ 'builtin2': '#79c0ff',
      \ 'comment': '#8b949e',
      \ 'conditional': '#ec8e2c',
      \ 'const': '#79c0ff',
      \ 'dep': '#fdac54',
      \ 'field': '#79c0ff',
      \ 'func': '#d2a8ff',
      \ 'ident': '#e6edf3',
      \ 'keyword': '#ec8e2c',
      \ 'number': '#79c0ff',
      \ 'operator': '#79c0ff',
      \ 'param': '#e6edf3',
      \ 'preproc': '#ec8e2c',
      \ 'regex': '#a5d6ff',
      \ 'statement': '#ec8e2c',
      \ 'string': '#a5d6ff',
      \ 'type': '#fdac54',
      \ 'tag': '#a5d6ff',
      \ 'variable': '#e6edf3'
    \ },
    \ 'diag': {
      \ 'error': '#d47616',
      \ 'warn': '#d29922',
      \ 'info': '#2f81f7',
      \ 'hint': '#7d8590'
    \ },
    \ 'diag_bg': {
      \ 'error': '#2b2017',
      \ 'warn': '#2b2519',
      \ 'info': '#122239',
      \ 'hint': '#1e2229'
    \ },
    \ 'diff': {
      \ 'add': '#101f37',
      \ 'delete': '#261d14',
      \ 'change': '#231e14',
      \ 'text': '#6e7681'
    \ },
    \ 'git': {
      \ 'add': '#58a6ff',
      \ 'removed': '#d47616',
      \ 'changed': '#d29922',
      \ 'conflict': '#d47616',
      \ 'ignored': '#6e7681'
    \ }
  \ }
  let l:spec.palette = github_theme#palette#github_dark_colorblind#get()
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
