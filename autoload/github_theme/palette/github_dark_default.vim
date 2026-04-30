" autoload/github_theme/palette/github_dark_default.vim
" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.
"
" Public API:
"   github_theme#palette#github_dark_default#meta() -> {name, light}
"   github_theme#palette#github_dark_default#get()  -> palette dict
"   github_theme#palette#github_dark_default#spec() -> spec dict (includes .palette)

function! github_theme#palette#github_dark_default#meta() abort
  return {
    \ 'name': 'github_dark_default',
    \ 'light': v:false
  \ }
endfunction

function! github_theme#palette#github_dark_default#get() abort
  return {
    \ 'orange': '#f0883e',
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
      \ 'base': '#3fb950',
      \ 'bright': '#56d364'
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
      \ 'base': '#ff7b72',
      \ 'bright': '#ffa198'
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
      \ 'fg': '#3fb950',
      \ 'emphasis': '#238636',
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
      \ 'fg': '#db6d28',
      \ 'emphasis': '#bd561d',
      \ 'muted': '#5f361e',
      \ 'subtle': '#221a19'
    \ },
    \ 'danger': {
      \ 'fg': '#f85149',
      \ 'emphasis': '#da3633',
      \ 'muted': '#6b2b2b',
      \ 'subtle': '#24171c'
    \ },
    \ 'open': {
      \ 'fg': '#3fb950',
      \ 'emphasis': '#238636',
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
      \ 'fg': '#f85149',
      \ 'emphasis': '#da3633',
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
      \ 'green': ['#aff5b4', '#7ee787', '#56d364', '#3fb950', '#2ea043', '#238636', '#196c2e', '#0f5323', '#033a16', '#04260f'],
      \ 'yellow': ['#f8e3a1', '#f2cc60', '#e3b341', '#d29922', '#bb8009', '#9e6a03', '#845306', '#693e00', '#4b2900', '#341a00'],
      \ 'orange': ['#ffdfb6', '#ffc680', '#ffa657', '#f0883e', '#db6d28', '#bd561d', '#9b4215', '#762d0a', '#5a1e02', '#3d1300'],
      \ 'red': ['#ffdcd7', '#ffc1ba', '#ffa198', '#ff7b72', '#f85149', '#da3633', '#b62324', '#8e1519', '#67060c', '#490202'],
      \ 'purple': ['#eddeff', '#e2c5ff', '#d2a8ff', '#bc8cff', '#a371f7', '#8957e5', '#6e40c9', '#553098', '#3c1e70', '#271052'],
      \ 'pink': ['#ffdaec', '#ffbedd', '#ff9bce', '#f778ba', '#db61a2', '#bf4b8a', '#9e3670', '#7d2457', '#5e103e', '#42062a'],
      \ 'coral': ['#ffddd2', '#ffc2b2', '#ffa28b', '#f78166', '#ea6045', '#cf462d', '#ac3220', '#872012', '#640d04', '#460701']
    \ }
  \ }
endfunction

function! github_theme#palette#github_dark_default#spec() abort
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
      \ 'builtin1': '#ff7b72',
      \ 'builtin2': '#79c0ff',
      \ 'comment': '#8b949e',
      \ 'conditional': '#ff7b72',
      \ 'const': '#79c0ff',
      \ 'dep': '#ffa198',
      \ 'field': '#79c0ff',
      \ 'func': '#d2a8ff',
      \ 'ident': '#e6edf3',
      \ 'keyword': '#ff7b72',
      \ 'number': '#79c0ff',
      \ 'operator': '#79c0ff',
      \ 'param': '#e6edf3',
      \ 'preproc': '#ff7b72',
      \ 'regex': '#a5d6ff',
      \ 'statement': '#ff7b72',
      \ 'string': '#a5d6ff',
      \ 'type': '#ffa657',
      \ 'tag': '#7ee787',
      \ 'variable': '#e6edf3'
    \ },
    \ 'diag': {
      \ 'error': '#f85149',
      \ 'warn': '#d29922',
      \ 'info': '#2f81f7',
      \ 'hint': '#7d8590'
    \ },
    \ 'diag_bg': {
      \ 'error': '#301b1e',
      \ 'warn': '#2b2519',
      \ 'info': '#122239',
      \ 'hint': '#1e2229'
    \ },
    \ 'diff': {
      \ 'add': '#10231c',
      \ 'delete': '#2c171b',
      \ 'change': '#231e14',
      \ 'text': '#6e7681'
    \ },
    \ 'git': {
      \ 'add': '#3fb950',
      \ 'removed': '#f85149',
      \ 'changed': '#d29922',
      \ 'conflict': '#db6d28',
      \ 'ignored': '#6e7681'
    \ }
  \ }
  let l:spec.palette = github_theme#palette#github_dark_default#get()
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
