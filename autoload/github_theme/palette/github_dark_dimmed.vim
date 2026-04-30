" autoload/github_theme/palette/github_dark_dimmed.vim
" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.
"
" Public API:
"   github_theme#palette#github_dark_dimmed#meta() -> {name, light}
"   github_theme#palette#github_dark_dimmed#get()  -> palette dict
"   github_theme#palette#github_dark_dimmed#spec() -> spec dict (includes .palette)

function! github_theme#palette#github_dark_dimmed#meta() abort
  return {
    \ 'name': 'github_dark_dimmed',
    \ 'light': v:false
  \ }
endfunction

function! github_theme#palette#github_dark_dimmed#get() abort
  return {
    \ 'orange': '#e0823d',
    \ 'black': {
      \ 'base': '#22272e',
      \ 'bright': '#2d333b'
    \ },
    \ 'gray': {
      \ 'base': '#636e7b',
      \ 'bright': '#636e7b'
    \ },
    \ 'blue': {
      \ 'base': '#539bf5',
      \ 'bright': '#6cb6ff'
    \ },
    \ 'green': {
      \ 'base': '#57ab5a',
      \ 'bright': '#6bc46d'
    \ },
    \ 'magenta': {
      \ 'base': '#b083f0',
      \ 'bright': '#dcbdfb'
    \ },
    \ 'pink': {
      \ 'base': '#e275ad',
      \ 'bright': '#fc8dc7'
    \ },
    \ 'red': {
      \ 'base': '#f47067',
      \ 'bright': '#ff938a'
    \ },
    \ 'white': {
      \ 'base': '#909dab',
      \ 'bright': '#909dab'
    \ },
    \ 'yellow': {
      \ 'base': '#c69026',
      \ 'bright': '#daaa3f'
    \ },
    \ 'cyan': {
      \ 'base': '#76e3ea',
      \ 'bright': '#b3f0ff'
    \ },
    \ 'fg': {
      \ 'default': '#e6edf3',
      \ 'muted': '#7d8590',
      \ 'subtle': '#636e7b',
      \ 'on_emphasis': '#cdd9e5'
    \ },
    \ 'canvas': {
      \ 'default': '#22272e',
      \ 'overlay': '#2d333b',
      \ 'inset': '#1c2128',
      \ 'subtle': '#2d333b'
    \ },
    \ 'border': {
      \ 'default': '#2d333b',
      \ 'muted': '#373e47',
      \ 'subtle': '#373c43'
    \ },
    \ 'neutral': {
      \ 'emphasis_plus': '#636e7b',
      \ 'emphasis': '#636e7b',
      \ 'muted': '#40474f',
      \ 'subtle': '#2a2f36'
    \ },
    \ 'accent': {
      \ 'fg': '#2f81f7',
      \ 'emphasis': '#316dca',
      \ 'muted': '#2b4f81',
      \ 'subtle': '#25364d'
    \ },
    \ 'success': {
      \ 'fg': '#57ab5a',
      \ 'emphasis': '#347d39',
      \ 'muted': '#275736',
      \ 'subtle': '#243931'
    \ },
    \ 'attention': {
      \ 'fg': '#c69026',
      \ 'emphasis': '#966600',
      \ 'muted': '#5f4b1f',
      \ 'subtle': '#393428'
    \ },
    \ 'severe': {
      \ 'fg': '#cc6b2c',
      \ 'emphasis': '#ae5622',
      \ 'muted': '#6c432c',
      \ 'subtle': '#342e2d'
    \ },
    \ 'danger': {
      \ 'fg': '#e5534b',
      \ 'emphasis': '#c93c37',
      \ 'muted': '#783839',
      \ 'subtle': '#372b31'
    \ },
    \ 'open': {
      \ 'fg': '#57ab5a',
      \ 'emphasis': '#347d39',
      \ 'muted': '#275736',
      \ 'subtle': '#243931'
    \ },
    \ 'done': {
      \ 'fg': '#986ee2',
      \ 'emphasis': '#8256d0',
      \ 'muted': '#56457e',
      \ 'subtle': '#2f2e42'
    \ },
    \ 'closed': {
      \ 'fg': '#e5534b',
      \ 'emphasis': '#c93c37',
      \ 'muted': '#783839',
      \ 'subtle': '#422d32'
    \ },
    \ 'sponsors': {
      \ 'fg': '#c96198',
      \ 'emphasis': '#ae4c82',
      \ 'muted': '#6c3e5c',
      \ 'subtle': '#342d3a'
    \ },
    \ 'scale': {
      \ 'black': '#1c2128',
      \ 'white': '#cdd9e5',
      \ 'gray': ['#cdd9e5', '#adbac7', '#909dab', '#768390', '#636e7b', '#545d68', '#444c56', '#373e47', '#2d333b', '#22272e'],
      \ 'blue': ['#c6e6ff', '#96d0ff', '#6cb6ff', '#539bf5', '#4184e4', '#316dca', '#255ab2', '#1b4b91', '#143d79', '#0f2d5c'],
      \ 'green': ['#b4f1b4', '#8ddb8c', '#6bc46d', '#57ab5a', '#46954a', '#347d39', '#2b6a30', '#245829', '#1b4721', '#113417'],
      \ 'yellow': ['#fbe090', '#eac55f', '#daaa3f', '#c69026', '#ae7c14', '#966600', '#805400', '#6c4400', '#593600', '#452700'],
      \ 'orange': ['#ffddb0', '#ffbc6f', '#f69d50', '#e0823d', '#cc6b2c', '#ae5622', '#94471b', '#7f3913', '#682d0f', '#4d210c'],
      \ 'red': ['#ffd8d3', '#ffb8b0', '#ff938a', '#f47067', '#e5534b', '#c93c37', '#ad2e2c', '#922323', '#78191b', '#5d0f12'],
      \ 'purple': ['#eedcff', '#dcbdfb', '#dcbdfb', '#b083f0', '#986ee2', '#8256d0', '#6b44bc', '#5936a2', '#472c82', '#352160'],
      \ 'pink': ['#ffd7eb', '#ffb3d8', '#fc8dc7', '#e275ad', '#c96198', '#ae4c82', '#983b6e', '#7e325a', '#69264a', '#551639'],
      \ 'coral': ['#ffdacf', '#ffb9a5', '#f79981', '#ec775c', '#de5b41', '#c2442d', '#a93524', '#8d291b', '#771d13', '#5d1008']
    \ }
  \ }
endfunction

function! github_theme#palette#github_dark_dimmed#spec() abort
  let l:spec = {
    \ 'bg0': '#1e222a',
    \ 'bg1': '#22272e',
    \ 'bg2': '#282e36',
    \ 'bg3': '#545d68',
    \ 'bg4': '#768390',
    \ 'fg0': '#636e7b',
    \ 'fg1': '#e6edf3',
    \ 'fg2': '#7d8590',
    \ 'fg3': '#636e7b',
    \ 'sel0': '#26426a',
    \ 'sel1': '#2a4b79',
    \ 'sel2': '#4d4c42',
    \ 'syntax': {
      \ 'bracket': '#e6edf3',
      \ 'builtin0': '#6cb6ff',
      \ 'builtin1': '#f47067',
      \ 'builtin2': '#6cb6ff',
      \ 'comment': '#768390',
      \ 'conditional': '#f47067',
      \ 'const': '#6cb6ff',
      \ 'dep': '#ff938a',
      \ 'field': '#6cb6ff',
      \ 'func': '#dcbdfb',
      \ 'ident': '#e6edf3',
      \ 'keyword': '#f47067',
      \ 'number': '#6cb6ff',
      \ 'operator': '#6cb6ff',
      \ 'param': '#e6edf3',
      \ 'preproc': '#f47067',
      \ 'regex': '#96d0ff',
      \ 'statement': '#f47067',
      \ 'string': '#96d0ff',
      \ 'type': '#f69d50',
      \ 'tag': '#8ddb8c',
      \ 'variable': '#e6edf3'
    \ },
    \ 'diag': {
      \ 'error': '#e5534b',
      \ 'warn': '#c69026',
      \ 'info': '#2f81f7',
      \ 'hint': '#7d8590'
    \ },
    \ 'diag_bg': {
      \ 'error': '#3f2e32',
      \ 'warn': '#3b372d',
      \ 'info': '#24344c',
      \ 'hint': '#30353d'
    \ },
    \ 'diff': {
      \ 'add': '#253430',
      \ 'delete': '#3b2a2f',
      \ 'change': '#333027',
      \ 'text': '#636e7b'
    \ },
    \ 'git': {
      \ 'add': '#57ab5a',
      \ 'removed': '#e5534b',
      \ 'changed': '#c69026',
      \ 'conflict': '#cc6b2c',
      \ 'ignored': '#636e7b'
    \ }
  \ }
  let l:spec.palette = github_theme#palette#github_dark_dimmed#get()
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
