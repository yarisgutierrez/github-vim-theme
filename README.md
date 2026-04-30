# github-vim-theme

A Vim port of [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme) — GitHub's official themes, now in pure vimscript. No Lua, no Neovim required.

## What's included

- **All 11 colorschemes** from the upstream Neovim theme:
  - `github_dark`, `github_dark_default`, `github_dark_dimmed`, `github_dark_high_contrast`, `github_dark_colorblind`, `github_dark_tritanopia`
  - `github_light`, `github_light_default`, `github_light_high_contrast`, `github_light_colorblind`, `github_light_tritanopia`
- **vim-airline themes** for all 11 variants (at `autoload/airline/themes/`)
- **lightline colorschemes** for all 11 variants (at `autoload/lightline/colorscheme/`)
- **Vim-compatible plugin modules**: ALE, coc.nvim, vim-gitgutter, vim-signify, NERDTree, fzf.vim, syntastic, tagbar, indent-blankline, vim-dirvish, vim-sneak, vim-floaterm
- **Color manipulation library** (`github_theme#color#*`) — port of the Lua `Color` class: `blend`, `brighten`, `lighten`, `saturate`, HSV/HSL conversions, WCAG luminance/contrast
- **Configuration API** (`g:github_theme_config`) with palette/spec/group overrides, styles, inverse, darken, and modules — all deep-merged over sensible defaults
- **Runtime API**: `github_theme#palette#load()`, `github_theme#spec#load()`, `github_theme#config#get()`, etc.
- **`:GithubThemeReload`** and **`:GithubThemeInfo`** commands
- **Helpfile** at `:help github-theme`

## Requirements

- Vim >= 8.0
- True color support recommended (`set termguicolors`). Falls back to xterm-256 approximations if unavailable.

## Installation

With vim-plug:

```vim
Plug 'github-vim-theme'
```

With Vim's built-in package manager:

```
mkdir -p ~/.vim/pack/themes/start
cp -r github-vim-theme ~/.vim/pack/themes/start/
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

## What's different from the Neovim original

**Deliberately skipped** (not applicable to Vim):

- Compile cache (`:GithubThemeCompile`) — Vim has no Lua bytecode cache. Loading is fast enough without it.
- `:GithubThemeInteractive` (autocmd-based reload via Lua module-cache invalidation) — replaced with the simpler `:GithubThemeReload`.
- Treesitter highlight groups — Vim doesn't have treesitter.
- Native LSP groups — Vim doesn't have `vim.lsp`.
- Neovim-only plugin modules: lualine, telescope, nvim-cmp, nvim-tree, neo-tree, gitsigns, nvim-notify, fidget, dap-ui, lspsaga, diffview, which-key, mini.nvim, treesitter-context. These plugins don't run in Vim, so their highlights have no target.

**Faithful ports**:

- All 11 palettes, derived eagerly at build time from the upstream `palette/primitives/*.lua` source (`scale` color ramps + `prettylights.syntax`). Blends precomputed from the same `a + (b-a)*f` formula the Lua color lib uses.
- Spec generation, matching `generate_spec()` in each Lua palette file.
- The full color manipulation library, tested against Python reference calculations.
- Configuration defaults, `inverse` toggles, `darken` behaviour, `styles` application.
- The airline palette logic from `lua/github-theme/util/airline.lua`.

## License

MIT, matching the upstream github-nvim-theme project.

Upstream project: <https://github.com/projekt0n/github-nvim-theme>
