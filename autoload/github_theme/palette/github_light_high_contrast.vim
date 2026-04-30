" autoload/github_theme/palette/github_light_high_contrast.vim
" AUTO-GENERATED from projekt0n/github-nvim-theme. Do not edit.
"
" Public API:
"   github_theme#palette#github_light_high_contrast#meta() -> {name, light}
"   github_theme#palette#github_light_high_contrast#get()  -> palette dict
"   github_theme#palette#github_light_high_contrast#spec() -> spec dict (includes .palette)

function! github_theme#palette#github_light_high_contrast#meta() abort
  return {
    \ 'name': 'github_light_high_contrast',
    \ 'light': v:true
  \ }
endfunction

function! github_theme#palette#github_light_high_contrast#get() abort
  return {
    \ 'orange': '#dc6d1a',
    \ 'gray': '#66707b',
    \ 'black': {
      \ 'base': '#0e1116',
      \ 'bright': '#4b535d'
    \ },
    \ 'white': {
      \ 'base': '#66707b',
      \ 'bright': '#88929d'
    \ },
    \ 'red': {
      \ 'base': '#a0111f',
      \ 'bright': '#86061d'
    \ },
    \ 'green': {
      \ 'base': '#024c1a',
      \ 'bright': '#055d20'
    \ },
    \ 'yellow': {
      \ 'base': '#3f2200',
      \ 'bright': '#4e2c00'
    \ },
    \ 'blue': {
      \ 'base': '#0349b4',
      \ 'bright': '#1168e3'
    \ },
    \ 'magenta': {
      \ 'base': '#622cbc',
      \ 'bright': '#844ae7'
    \ },
    \ 'pink': {
      \ 'base': '#971368',
      \ 'bright': '#c9248e'
    \ },
    \ 'cyan': {
      \ 'base': '#1b7c83',
      \ 'bright': '#3192aa'
    \ },
    \ 'fg': {
      \ 'default': '#010409',
      \ 'muted': '#ced5dc',
      \ 'subtle': '#66707b',
      \ 'on_emphasis': '#ffffff'
    \ },
    \ 'canvas': {
      \ 'default': '#ffffff',
      \ 'overlay': '#ffffff',
      \ 'inset': '#ffffff',
      \ 'subtle': '#e7ecf0'
    \ },
    \ 'border': {
      \ 'default': '#ced5dc',
      \ 'muted': '#ced5dc',
      \ 'subtle': '#34363a'
    \ },
    \ 'neutral': {
      \ 'emphasis_plus': '#0e1116',
      \ 'emphasis': '#66707b',
      \ 'muted': '#eef0f2',
      \ 'subtle': '#f3f6f8'
    \ },
    \ 'accent': {
      \ 'fg': '#0349b4',
      \ 'emphasis': '#0349b4',
      \ 'muted': '#afd1fd',
      \ 'subtle': '#dff7ff'
    \ },
    \ 'success': {
      \ 'fg': '#055d20',
      \ 'emphasis': '#1f883d',
      \ 'muted': '#a8d9b6',
      \ 'subtle': '#d2fedb'
    \ },
    \ 'attention': {
      \ 'fg': '#744500',
      \ 'emphasis': '#744500',
      \ 'muted': '#e1ce9c',
      \ 'subtle': '#fcf7be'
    \ },
    \ 'severe': {
      \ 'fg': '#873800',
      \ 'emphasis': '#873800',
      \ 'muted': '#f1c5a3',
      \ 'subtle': '#fff2d5'
    \ },
    \ 'danger': {
      \ 'fg': '#d1242f',
      \ 'emphasis': '#a0111f',
      \ 'muted': '#f8bdbe',
      \ 'subtle': '#fff0ee'
    \ },
    \ 'open': {
      \ 'fg': '#055d20',
      \ 'emphasis': '#1f883d',
      \ 'muted': '#a8d9b6',
      \ 'subtle': '#d2fedb'
    \ },
    \ 'closed': {
      \ 'fg': '#d1242f',
      \ 'emphasis': '#a0111f',
      \ 'muted': '#f8bdbe',
      \ 'subtle': '#fff0ee'
    \ },
    \ 'done': {
      \ 'fg': '#622cbc',
      \ 'emphasis': '#622cbc',
      \ 'muted': '#dac6fc',
      \ 'subtle': '#faf0fe'
    \ },
    \ 'sponsors': {
      \ 'fg': '#971368',
      \ 'emphasis': '#971368',
      \ 'muted': '#f8b7df',
      \ 'subtle': '#feeff7'
    \ },
    \ 'scale': {
      \ 'black': '#010409',
      \ 'white': '#ffffff',
      \ 'gray': ['#ffffff', '#e7ecf0', '#ced5dc', '#acb6c0', '#88929d', '#66707b', '#4b535d', '#343b43', '#20252c', '#0e1116'],
      \ 'blue': ['#dff7ff', '#9cd7ff', '#67b3fd', '#368cf9', '#1168e3', '#0349b4', '#023b95', '#022f7a', '#032563', '#021a4a'],
      \ 'green': ['#d2fedb', '#82e596', '#43c663', '#26a148', '#117f32', '#055d20', '#024c1a', '#013d14', '#003110', '#00230b'],
      \ 'yellow': ['#fcf7be', '#f0ce53', '#d5a824', '#b58407', '#956400', '#744500', '#603700', '#4e2c00', '#3f2200', '#2e1800'],
      \ 'orange': ['#fff2d5', '#ffc67b', '#f99636', '#dc6d1a', '#b45105', '#873800', '#702c00', '#5b2300', '#491b00', '#361200'],
      \ 'red': ['#fff0ee', '#ffc1bc', '#ff8e8a', '#ee5a5d', '#d5232c', '#a0111f', '#86061d', '#6e011a', '#5a0016', '#430011'],
      \ 'purple': ['#faf0fe', '#e0c5ff', '#c49bff', '#a371f7', '#844ae7', '#622cbc', '#512598', '#411d7b', '#341763', '#260f49'],
      \ 'pink': ['#feeff7', '#ffbde0', '#fc87ca', '#ed4baf', '#c9248e', '#971368', '#7d0c57', '#660847', '#53043a', '#3e022b'],
      \ 'coral': ['#fff0ed', '#ffc2b6', '#ff8f7e', '#ef5b48', '#cd3425', '#9f1710', '#870706', '#6f0107', '#5b0002', '#430200']
    \ }
  \ }
endfunction

function! github_theme#palette#github_light_high_contrast#spec() abort
  let l:spec = {
    \ 'bg0': '#ffffff',
    \ 'bg1': '#ffffff',
    \ 'bg2': '#f0f1f2',
    \ 'bg3': '#e6e9ef',
    \ 'bg4': '#66707b',
    \ 'fg0': '#66707b',
    \ 'fg1': '#010409',
    \ 'fg2': '#20252c',
    \ 'fg3': '#4b535d',
    \ 'sel0': '#d9e4f4',
    \ 'sel1': '#b7d6fd',
    \ 'sel2': '#d5c7b2',
    \ 'syntax': {
      \ 'bracket': '#010409',
      \ 'builtin0': '#023b95',
      \ 'builtin1': '#a0111f',
      \ 'builtin2': '#023b95',
      \ 'comment': '#4b535d',
      \ 'conditional': '#a0111f',
      \ 'const': '#023b95',
      \ 'dep': '#6e011a',
      \ 'field': '#023b95',
      \ 'func': '#512598',
      \ 'ident': '#010409',
      \ 'keyword': '#a0111f',
      \ 'number': '#023b95',
      \ 'operator': '#023b95',
      \ 'param': '#010409',
      \ 'preproc': '#a0111f',
      \ 'regex': '#032563',
      \ 'statement': '#a0111f',
      \ 'string': '#032563',
      \ 'type': '#702c00',
      \ 'tag': '#024c1a',
      \ 'variable': '#010409'
    \ },
    \ 'diag': {
      \ 'error': '#d1242f',
      \ 'warn': '#744500',
      \ 'info': '#0349b4',
      \ 'hint': '#ced5dc'
    \ },
    \ 'diag_bg': {
      \ 'error': '#f8dee0',
      \ 'warn': '#eae3d9',
      \ 'info': '#d9e4f4',
      \ 'hint': '#f8f9fa'
    \ },
    \ 'diff': {
      \ 'add': '#b3c9ba',
      \ 'delete': '#dbb4bb',
      \ 'change': '#cfc3b2',
      \ 'text': '#66707b'
    \ },
    \ 'git': {
      \ 'add': '#055d20',
      \ 'removed': '#d1242f',
      \ 'changed': '#744500',
      \ 'conflict': '#873800',
      \ 'ignored': '#66707b'
    \ }
  \ }
  let l:spec.palette = github_theme#palette#github_light_high_contrast#get()
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
