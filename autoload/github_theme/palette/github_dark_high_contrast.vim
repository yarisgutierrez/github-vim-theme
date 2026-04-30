" autoload/github_theme/palette/github_dark_high_contrast.vim
" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.
"
" Public API:
"   github_theme#palette#github_dark_high_contrast#meta() -> {name, light}
"   github_theme#palette#github_dark_high_contrast#get()  -> palette dict
"   github_theme#palette#github_dark_high_contrast#spec() -> spec dict (includes .palette)

function! github_theme#palette#github_dark_high_contrast#meta() abort
  return {
    \ 'name': 'github_dark_high_contrast',
    \ 'light': v:false
  \ }
endfunction

function! github_theme#palette#github_dark_high_contrast#get() abort
  return {
    \ 'orange': '#fe9a2d',
    \ 'black': {
      \ 'base': '#0a0c10',
      \ 'bright': '#272b33'
    \ },
    \ 'gray': {
      \ 'base': '#9ea7b3',
      \ 'bright': '#9ea7b3'
    \ },
    \ 'blue': {
      \ 'base': '#71b7ff',
      \ 'bright': '#91cbff'
    \ },
    \ 'green': {
      \ 'base': '#26cd4d',
      \ 'bright': '#4ae168'
    \ },
    \ 'magenta': {
      \ 'base': '#cb9eff',
      \ 'bright': '#dbb7ff'
    \ },
    \ 'pink': {
      \ 'base': '#ff8dc7',
      \ 'bright': '#ffadd4'
    \ },
    \ 'red': {
      \ 'base': '#ff9492',
      \ 'bright': '#ffb1af'
    \ },
    \ 'white': {
      \ 'base': '#d9dee3',
      \ 'bright': '#d9dee3'
    \ },
    \ 'yellow': {
      \ 'base': '#f0b72f',
      \ 'bright': '#f7c843'
    \ },
    \ 'cyan': {
      \ 'base': '#76e3ea',
      \ 'bright': '#b3f0ff'
    \ },
    \ 'fg': {
      \ 'default': '#e6edf3',
      \ 'muted': '#7d8590',
      \ 'subtle': '#9ea7b3',
      \ 'on_emphasis': '#ffffff'
    \ },
    \ 'canvas': {
      \ 'default': '#0a0c10',
      \ 'overlay': '#272b33',
      \ 'inset': '#010409',
      \ 'subtle': '#272b33'
    \ },
    \ 'border': {
      \ 'default': '#272b33',
      \ 'muted': '#272b33',
      \ 'subtle': '#212328'
    \ },
    \ 'neutral': {
      \ 'emphasis_plus': '#9ea7b3',
      \ 'emphasis': '#9ea7b3',
      \ 'muted': '#32363d',
      \ 'subtle': '#14171b'
    \ },
    \ 'accent': {
      \ 'fg': '#2f81f7',
      \ 'emphasis': '#409eff',
      \ 'muted': '#1c3f6f',
      \ 'subtle': '#111f34'
    \ },
    \ 'success': {
      \ 'fg': '#26cd4d',
      \ 'emphasis': '#09b43a',
      \ 'muted': '#184724',
      \ 'subtle': '#0f2218'
    \ },
    \ 'attention': {
      \ 'fg': '#f0b72f',
      \ 'emphasis': '#e09b13',
      \ 'muted': '#513a0d',
      \ 'subtle': '#251d0f'
    \ },
    \ 'severe': {
      \ 'fg': '#e7811d',
      \ 'emphasis': '#e7811d',
      \ 'muted': '#5e331a',
      \ 'subtle': '#1f1612'
    \ },
    \ 'danger': {
      \ 'fg': '#ff6a69',
      \ 'emphasis': '#ff6a69',
      \ 'muted': '#692827',
      \ 'subtle': '#221316'
    \ },
    \ 'open': {
      \ 'fg': '#26cd4d',
      \ 'emphasis': '#09b43a',
      \ 'muted': '#184724',
      \ 'subtle': '#0f2218'
    \ },
    \ 'done': {
      \ 'fg': '#b780ff',
      \ 'emphasis': '#b87fff',
      \ 'muted': '#47346c',
      \ 'subtle': '#191627'
    \ },
    \ 'closed': {
      \ 'fg': '#ff6a69',
      \ 'emphasis': '#ff6a69',
      \ 'muted': '#692827',
      \ 'subtle': '#2e1619'
    \ },
    \ 'sponsors': {
      \ 'fg': '#ef6eb1',
      \ 'emphasis': '#ef6eb1',
      \ 'muted': '#5e2e4a',
      \ 'subtle': '#1f141f'
    \ },
    \ 'scale': {
      \ 'black': '#010409',
      \ 'white': '#ffffff',
      \ 'gray': ['#ffffff', '#f0f3f6', '#d9dee3', '#bdc4cc', '#9ea7b3', '#7a828e', '#525964', '#272b33', '#272b33', '#0a0c10'],
      \ 'blue': ['#caeaff', '#addcff', '#91cbff', '#71b7ff', '#409eff', '#409eff', '#318bf8', '#2672f3', '#1e60d5', '#194fb1'],
      \ 'green': ['#acf7b6', '#72f088', '#4ae168', '#26cd4d', '#09b43a', '#09b43a', '#02a232', '#008c2c', '#007728', '#006222'],
      \ 'yellow': ['#fbe59e', '#fbd669', '#f7c843', '#f0b72f', '#e09b13', '#e09b13', '#c88508', '#ae7104', '#945d02', '#7b4900'],
      \ 'orange': ['#ffe1b4', '#ffcf86', '#ffb757', '#fe9a2d', '#e7811d', '#e7811d', '#d57014', '#bf5e0a', '#a74c00', '#8f3c00'],
      \ 'red': ['#ffdedb', '#ffc9c7', '#ffb1af', '#ff9492', '#ff6a69', '#ff6a69', '#ff4445', '#e82a2f', '#cc1421', '#ad0116'],
      \ 'purple': ['#f0dfff', '#e6ccff', '#dbb7ff', '#cb9eff', '#b780ff', '#b87fff', '#a66bff', '#954ffd', '#8031f7', '#6921d7'],
      \ 'pink': ['#ffdceb', '#ffc7e1', '#ffadd4', '#ff8dc7', '#ef6eb1', '#ef6eb1', '#e456a3', '#d23d91', '#b72c7d', '#9c1d6a'],
      \ 'coral': ['#ffded4', '#ffcbb9', '#ffb39b', '#ff967d', '#fc704f', '#fc704f', '#f75133', '#e03b21', '#c62612', '#a91500']
    \ }
  \ }
endfunction

function! github_theme#palette#github_dark_high_contrast#spec() abort
  let l:spec = {
    \ 'bg0': '#03060b',
    \ 'bg1': '#0a0c10',
    \ 'bg2': '#191c20',
    \ 'bg3': '#7a828e',
    \ 'bg4': '#bdc4cc',
    \ 'fg0': '#9ea7b3',
    \ 'fg1': '#e6edf3',
    \ 'fg2': '#7d8590',
    \ 'fg3': '#9ea7b3',
    \ 'sel0': '#152f55',
    \ 'sel1': '#1a3a66',
    \ 'sel2': '#3a372c',
    \ 'syntax': {
      \ 'bracket': '#e6edf3',
      \ 'builtin0': '#91cbff',
      \ 'builtin1': '#ff9492',
      \ 'builtin2': '#91cbff',
      \ 'comment': '#bdc4cc',
      \ 'conditional': '#ff9492',
      \ 'const': '#91cbff',
      \ 'dep': '#ffb1af',
      \ 'field': '#91cbff',
      \ 'func': '#dbb7ff',
      \ 'ident': '#e6edf3',
      \ 'keyword': '#ff9492',
      \ 'number': '#91cbff',
      \ 'operator': '#91cbff',
      \ 'param': '#e6edf3',
      \ 'preproc': '#ff9492',
      \ 'regex': '#addcff',
      \ 'statement': '#ff9492',
      \ 'string': '#addcff',
      \ 'type': '#ffb757',
      \ 'tag': '#72f088',
      \ 'variable': '#e6edf3'
    \ },
    \ 'diag': {
      \ 'error': '#ff6a69',
      \ 'warn': '#f0b72f',
      \ 'info': '#2f81f7',
      \ 'hint': '#7d8590'
    \ },
    \ 'diag_bg': {
      \ 'error': '#2f1a1d',
      \ 'warn': '#2c2615',
      \ 'info': '#101e33',
      \ 'hint': '#1b1e23'
    \ },
    \ 'diff': {
      \ 'add': '#0a2516',
      \ 'delete': '#2f1a1d',
      \ 'change': '#2a2110',
      \ 'text': '#9ea7b3'
    \ },
    \ 'git': {
      \ 'add': '#26cd4d',
      \ 'removed': '#ff6a69',
      \ 'changed': '#f0b72f',
      \ 'conflict': '#e7811d',
      \ 'ignored': '#9ea7b3'
    \ }
  \ }
  let l:spec.palette = github_theme#palette#github_dark_high_contrast#get()
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
