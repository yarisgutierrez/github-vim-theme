# github-vim-theme

A Vimport of [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme) — GitHub's official themes, rewritten purely in vimscript.

## What's included

- **All 11 colorschemes** from the upstream Neovim theme:
  - `github_dark`
  - `github_dark_default`
  - `github_dark_dimmed`
  - `github_dark_high_contrast`
  - `github_dark_colorblind`
  - `github_dark_tritanopia`
  - `github_light`
  - `github_light_default`
  - `github_light_high_contrast`
  - `github_light_colorblind`
  - `github_light_tritanopia`
- **vim-airline themes** for all 11 variants
- **lightline colorschemes** for all 11 variants
- **Color manipulation library** (`github_theme#color#*`) — port of the Lua `Color` class: `blend`, `brighten`, `lighten`, `saturate`, HSV/HSL conversions, WCAG luminance/contrast

## Plugin Support

- ALE
- coc.nvim
- vim-gitgutter
- vim-signify
- NERDTree
- fzf.vim
- syntastic
- tagbar
- indent-blankline
- vim-dirvish
- vim-sneak
- vim-floaterm

## Requirements

- Vim &gt;= 8.0
- True color support recommended (`set termguicolors`). Falls back to xterm-256 approximations if unavailable.

## Installation

Vim-Plug

```vim
Plug 'yarisgutierrez/github-vim-theme'
```

## Usage

```vim
set termguicolors
syntax on

colorscheme github_dark_default
```

With vim-airline:

```vim
let g:airline_theme = 'github_dark_default'
```

With lightline:

```vim
let g:lightline = { 'colorscheme': 'github_dark_default' }
```

## Configuration example

```vim
let g:github_theme_config = {
  \ 'options': {
    \ 'transparent': v:true,
    \ 'hide_end_of_buffer': v:true,
    \ 'styles': {
      \ 'comments': 'italic',
      \ 'keywords': 'bold'
    \ },
    \ 'modules': {
      \ 'ale': v:true,
      \ 'gitgutter': v:true
    \ }
  \ },
  \ 'palettes': {
    \ 'github_dark': {
      \ 'red': { 'base': '#ff6b6b', 'bright': '#ff9999' }
    \ }
  \ },
  \ 'specs': {
    \ 'all': { 'syntax': { 'keyword': 'magenta' } }
  \ },
  \ 'groups': {
    \ 'all': { 'Whitespace': { 'link': 'Comment' } }
  \ }
\ }
colorscheme github_dark
```

## License

MIT, matching the upstream github-nvim-theme project.

Upstream project: <https://github.com/projekt0n/github-nvim-theme>