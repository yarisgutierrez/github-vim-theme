" autoload/github_theme/palette/github_dark.vim
" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.
"
" Public API:
"   github_theme#palette#github_dark#meta() -> {name, light}
"   github_theme#palette#github_dark#get()  -> palette dict
"   github_theme#palette#github_dark#spec() -> spec dict (includes .palette)

function! github_theme#palette#github_dark#meta() abort
  return {
    \ 'name': 'github_dark',
    \ 'light': v:false
  \ }
endfunction

function! github_theme#palette#github_dark#get() abort
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
      \ 'default': '#30363d',
      \ 'overlay': '#161b22',
      \ 'inset': '#21262d',
      \ 'subtle': '#161b22'
    \ },
    \ 'border': {
      \ 'default': '#161b22',
      \ 'muted': '#21262d',
      \ 'subtle': '#434950'
    \ },
    \ 'neutral': {
      \ 'emphasis_plus': '#6e7681',
      \ 'emphasis': '#6e7681',
      \ 'muted': '#495058',
      \ 'subtle': '#363c44'
    \ },
    \ 'accent': {
      \ 'fg': '#2f81f7',
      \ 'emphasis': '#1f6feb',
      \ 'muted': '#33588a',
      \ 'subtle': '#31435a'
    \ },
    \ 'success': {
      \ 'fg': '#3fb950',
      \ 'emphasis': '#238636',
      \ 'muted': '#2f603f',
      \ 'subtle': '#30463e'
    \ },
    \ 'attention': {
      \ 'fg': '#d29922',
      \ 'emphasis': '#9e6a03',
      \ 'muted': '#685428',
      \ 'subtle': '#454135'
    \ },
    \ 'severe': {
      \ 'fg': '#db6d28',
      \ 'emphasis': '#bd561d',
      \ 'muted': '#744c35',
      \ 'subtle': '#413c3b'
    \ },
    \ 'danger': {
      \ 'fg': '#f85149',
      \ 'emphasis': '#da3633',
      \ 'muted': '#804142',
      \ 'subtle': '#44393e'
    \ },
    \ 'open': {
      \ 'fg': '#3fb950',
      \ 'emphasis': '#238636',
      \ 'muted': '#2f603f',
      \ 'subtle': '#30463e'
    \ },
    \ 'done': {
      \ 'fg': '#a371f7',
      \ 'emphasis': '#8957e5',
      \ 'muted': '#5e4e87',
      \ 'subtle': '#3c3c50'
    \ },
    \ 'closed': {
      \ 'fg': '#f85149',
      \ 'emphasis': '#da3633',
      \ 'muted': '#804142',
      \ 'subtle': '#4e3a3f'
    \ },
    \ 'sponsors': {
      \ 'fg': '#db61a2',
      \ 'emphasis': '#bf4b8a',
      \ 'muted': '#744765',
      \ 'subtle': '#413a47'
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

function! github_theme#palette#github_dark#spec() abort
  let l:spec = {
    \ 'bg0': '#252a31',
    \ 'bg1': '#30363d',
    \ 'bg2': '#363c44',
    \ 'bg3': '#484f58',
    \ 'bg4': '#8b949e',
    \ 'fg0': '#6e7681',
    \ 'fg1': '#e6edf3',
    \ 'fg2': '#7d8590',
    \ 'fg3': '#6e7681',
    \ 'sel0': '#304c75',
    \ 'sel1': '#335582',
    \ 'sel2': '#585951',
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
      \ 'error': '#4e3a3f',
      \ 'warn': '#484539',
      \ 'info': '#304159',
      \ 'hint': '#3c4249'
    \ },
    \ 'diff': {
      \ 'add': '#2e423c',
      \ 'delete': '#4a363c',
      \ 'change': '#403e34',
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
  let l:spec.palette = github_theme#palette#github_dark#get()
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
