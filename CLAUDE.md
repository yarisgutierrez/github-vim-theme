# github-vim-theme — Claude project briefing

This file is read by Claude Code at the start of every session in this repo.
It exists to bring you up to speed on **what this project is, what's intentional vs. accidental, and where the landmines are** so you don't waste turns re-discovering them.

## What this is

A pure-vimscript port of [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme), built from scratch over a multi-turn conversation. It provides:

- All 11 GitHub colorschemes (`github_dark`, `github_dark_default`, `github_dark_dimmed`, `github_dark_high_contrast`, `github_dark_colorblind`, `github_dark_tritanopia`, `github_light`, `github_light_default`, `github_light_high_contrast`, `github_light_colorblind`, `github_light_tritanopia`)
- vim-airline themes for all 11 variants
- lightline colorschemes for all 11 variants
- Vim-compatible plugin module highlights (ALE, coc, gitgutter, signify, NERDTree, fzf, syntastic, tagbar, indent-blankline, dirvish, sneak, floaterm)
- A color manipulation library (`autoload/github_theme/color.vim`) — port of the upstream Lua `Color` class
- Configuration via `g:github_theme_config` with deep-merge user overrides for palettes/specs/groups
- `:GithubThemeReload` and `:GithubThemeInfo` commands

**It is NOT a wrapper around or shim for the Lua original.** No Lua, no Neovim required. Works on Vim 8+ with `set termguicolors`.

## The user

The user is **Protocol** — independent developer/software creator on Connecticut. Mac user (Terminal.app). Uses vim-plug (configured at `~/.vim/plugged`). Has multiple themes installed (gruvbox, rose-pine, ayu) but built this port specifically for github_dark_dimmed and prefers it as their daily driver. Also uses lightline rather than airline as their statusline.

## Repository layout

```
github-vim-theme/
├── autoload/
│   ├── github_theme/
│   │   ├── airline.vim          ← airline palette builder
│   │   ├── collect.vim          ← deep_extend / deep_copy utilities
│   │   ├── color.vim            ← color math (blend, hsl, hsv, luminance, etc.)
│   │   ├── config.vim           ← g:github_theme_config defaults + access
│   │   ├── highlight.vim        ← :hi emitter + xterm-256 cterm fallback
│   │   ├── lightline.vim        ← lightline palette builder
│   │   ├── palette.vim          ← top-level palette dispatcher
│   │   ├── spec.vim             ← top-level spec dispatcher
│   │   ├── theme.vim            ← MAIN ENTRY POINT — orchestrates apply()
│   │   ├── groups/
│   │   │   ├── editor.vim       ← Normal, Pmenu, Visual, Diff, etc.
│   │   │   ├── syntax.vim       ← Comment, Function, Keyword, Type, etc.
│   │   │   └── terminal.vim     ← g:terminal_ansi_colors
│   │   ├── modules/             ← ALE, coc, gitgutter, ... (12 files)
│   │   └── palette/
│   │       ├── github_dark.vim          ← per-theme palette + spec
│   │       ├── github_dark_default.vim  ← (...10 more...)
│   │       └── primitives/
│   │           ├── dark.vim             ← scale + prettylights
│   │           ├── dark_dimmed.vim
│   │           └── ... (9 total)
│   ├── airline/themes/          ← 11 airline theme files (one per variant)
│   └── lightline/colorscheme/   ← 11 lightline files
├── colors/                      ← 11 colors/<theme>.vim files
├── plugin/github_theme.vim      ← :GithubThemeReload, :GithubThemeInfo
├── doc/github-theme.txt         ← :help github-theme
├── tools/
│   ├── build_palettes.py        ← regenerates palette/primitives/*.vim
│   └── primitives_json/         ← extracted JSON from upstream Lua primitives
├── companion-themes/            ← Terminal.app, Xcode, bat themes (dimmed only)
├── README.md
└── LICENSE                      ← MIT, matching upstream
```

## Architecture / dataflow

```
   [primitives JSON]            (upstream's source of truth — color ramps + prettylights)
         │
         ▼
   tools/build_palettes.py      (offline; generates static vimscript with eagerly-blended hex)
         │
         ▼
   autoload/github_theme/palette/<theme>.vim    (palette + spec, all blends pre-computed)
         │
         ▼
   github_theme#spec#load(name)                 (runtime; applies user overrides via deep_extend)
         │
         ▼
   github_theme#theme#apply(name)               (called from colors/<theme>.vim)
         │  ├─ set background=light/dark FIRST     (this ordering matters — see Landmines)
         │  ├─ highlight clear; syntax reset
         │  ├─ collect groups: editor + syntax + enabled modules
         │  ├─ apply user groups overrides
         │  ├─ flush via highlight#apply (emits :hi commands)
         │  └─ apply terminal colors
         ▼
   :hi commands fire → vim renders
```

The key design choice: **all color blending happens at generation time** (in `tools/build_palettes.py`), not at runtime. The vimscript palette files contain hardcoded hex like `'sel0': '#1c2e4f'`, never `blend(bg, accent, 0.30)`. This makes the vim theme load instantly with no math at runtime, but it also means **changing a primitives value or palette derivation requires regenerating** the palette files via the Python script (see "Regenerating palettes" below).

## Conventions and intentional decisions

These are choices that look weird but are deliberate. **Don't "fix" them without checking with the user first:**

1. **`github_dark` (no suffix) intentionally uses `#30363d` as bg, NOT pure GitHub black.** Only `github_dark_default` uses `#0d1117`. This matches the upstream Lua repo, which hardcodes `scale.gray[7]` for that one variant. If a user complains "github_dark looks washed out," the answer is "use `github_dark_default`."

2. **Color library uses dict-based color representation**, not hex strings as primary type. Functions accept either, but internally pass dicts. `to_hex()` is the conversion to string.

3. **Funcref locals must be capitalized**: `let l:Blend = function(...)`. Vimscript enforces this and will error `E704: Funcref variable name must start with a capital`. Already bit me once during development.

4. **The compile cache is intentionally absent.** Upstream uses `:GithubThemeCompile` to serialize highlights to Lua bytecode for fast startup. Vim has no equivalent and the compile path is fast enough without it. Don't try to add a cache.

5. **`:GithubThemeInteractive` (autocmd reload) is intentionally absent.** Replaced with the simpler `:GithubThemeReload`. Vim has no module cache to bust, so reload-on-save would just re-run the colorscheme command, which the user can do manually anytime.

6. **Treesitter, native LSP, and Neovim-only plugins (telescope, nvim-cmp, gitsigns, lualine, nvim-tree, etc.) are intentionally not ported.** These plugins don't run in Vim. Adding their highlight groups would be dead code. The full skipped list is in the README.

7. **`module_default` defaults to `v:true`.** Modules opt out, not in.

## Landmines / non-obvious bugs already fixed

These took several debug cycles to find. **If you're tempted to refactor the affected code, read this first:**

### 1. `function('github_theme#modules#X#get')` does NOT trigger autoload

The Funcref returned by `function()` is "alive" but doesn't load the corresponding autoload file. Calling it will error silently and `try/catch` swallows it. **Always use `execute 'let result = github_theme#modules#X#get(...)'`** to force the autoload. The current `theme.vim` does this in the module loop. Don't refactor it back to `function()`.

### 2. `set background` order matters

`set background=dark` (or light) implicitly re-initializes vim's default highlight groups for that mode. If you do `highlight clear` BEFORE `set background`, vim re-populates groups with its mode-defaults that the colorscheme then needs to overwrite — and any group the colorscheme doesn't explicitly set ends up with a default-mode color, often the WRONG mode's default. **Order is: `set background` first, THEN `highlight clear`, THEN apply.** Bug presented as "EndOfBuffer is darker than the editor background" before it was fixed.

### 3. `redir =>` inside a function called from a `redir!` block clobbers the outer redir

If you write a helper that captures `:hi` output via `redir => out / silent hi NAME / redir END` and call it from a script that's already redirecting via `redir! > /tmp/file`, the inner `redir END` closes the outer redir too. Vim has only one global redir slot. Workaround used in tests: collect into a list, write at the end with `writefile()`. Don't expect nested redir to work.

### 4. Vim's `max([floats])` and `min([floats])` only work on integer lists

`max([0.5, 0.7, 0.3])` does NOT do what you'd expect — it casts to integers first. The color library has manual `s:fmax3` / `s:fmin3` helpers for this. Don't try to "simplify" them back to `max([...])`.

### 5. Vim-plug `Plug 'name-without-slash'` is no longer accepted

The deprecated `vim-scripts/<n>` shorthand is now a hard error. Local plugins must use a path: `Plug '~/.vim/plugged/github-vim-theme'`. The README still has the old form in the install snippet — should be updated.

## How user overrides work

Users set `g:github_theme_config` BEFORE `:colorscheme`. The config is deep-merged over defaults. Three override surfaces, applied in this order:

1. **`palettes`** — change named colors that feed into spec generation (e.g., `red.base`)
2. **`specs`** — change semantic spec colors (e.g., `syntax.keyword`, `bg1`, `diff.add`)
3. **`groups`** — change individual highlight groups wholesale (e.g., `Whitespace: { link: 'Comment' }`)

Each level supports an `all` key (applies to all themes) plus per-theme keys (e.g., `github_dark_dimmed`).

The deep-merge is in `autoload/github_theme/collect.vim`. **Don't break the recursive case** — vim's built-in `extend()` only merges one level deep.

## Regenerating palettes

If upstream's primitives change or you want to alter how palettes are derived from primitives:

1. **Update primitives JSON** in `tools/primitives_json/` (or re-extract from a fresh `github-nvim-theme` clone — the upstream files are at `lua/github-theme/palette/primitives/*.lua` and embed JSON in `[=[ ... ]=]` blocks)
2. **Run** `python3 tools/build_palettes.py`
3. **Verify** the generated palettes diff sensibly: `git diff autoload/github_theme/palette/`

The script writes to `/home/claude/github-vim-theme/...` paths in its current form — adjust `OUT_BASE` to match your local clone.

## Testing

There's no formal test framework, but the development pattern that worked was:

1. Write a vimscript test file that exercises the change
2. Run via: `vim -es -N -u NONE -S /tmp/test.vim`
3. Capture output via `redir! > /tmp/out.txt` (or `writefile(list, path)` if nesting)
4. Diff against expected hex values

Useful inspection commands once a colorscheme is loaded:

```vim
:verbose hi Normal              " shows last file that set Normal
:hi GitGutterAdd                " quick check a module group
:echo synIDattr(synIDtrans(hlID("Normal")), "bg#")    " resolved bg color
:echo &background               " current bg mode
:GithubThemeInfo                " summary of active theme
```

## Companion themes

`companion-themes/` contains Terminal.app, Xcode, and bat (Sublime tmTheme) versions of `github_dark_dimmed`. Generators are inline-Python and were one-shot — if you need to produce them for other variants, the palette data is in `autoload/github_theme/palette/<variant>.vim` and the structure is:

- **Terminal.app**: 16 ANSI slots from `palette.{black,red,green,yellow,blue,magenta,cyan,white}.{base,bright}`, plus `BackgroundColor`, `TextColor`, `CursorColor`, `SelectionColor`. Format is plist with each color as a base64-encoded NSKeyedArchiver of an NSColor.
- **Xcode**: plist; colors are space-separated `"R.R G.G B.B A"` strings; syntax categories like `xcode.syntax.keyword`, `xcode.syntax.string`, etc.
- **bat (.tmTheme)**: TextMate plist; `settings` is a list where the first entry is global (background, foreground, etc.) and subsequent entries map TextMate scopes to colors.

## Things to be careful about

- **The user has manual overrides in their `.vimrc`** — at minimum: `hi clear SignColumn` and a custom `BadWhitespaces` group. These run AFTER colorscheme. If you change the order or content of group emission, theirs still need to win. Test that.
- **The user matches their lightline colorscheme to their editor colorscheme.** If you add a new variant, generate a matching lightline file too.
- **README install snippet says `Plug 'github-vim-theme'`** — this is wrong (deprecated form, see Landmines #5). Should be `Plug '~/.vim/plugged/github-vim-theme'` for local install or a real `user/repo` slug if/when published.
- **Don't apologize excessively or restructure on speculation.** The user values direct, reasoned answers and would rather be told "I don't know, let me check" than have unverified claims dressed up as confident ones.

## What works (verified)

End-to-end smoke tests passed for:
- All 11 colorschemes loading without error
- Core editor highlights (Normal, Comment, Function, Keyword, Visual, Search, Pmenu, LineNr, MatchParen, DiffAdd) matching upstream spec exactly
- All 12 module highlights (ALE, gitgutter, coc, NERDTree, FloatBorder, Sneak, Tagbar, Signify, Syntastic, Floaterm, etc.)
- All 11 airline palettes building (7 modes each)
- All 11 lightline palettes building (8 modes each, with `lightline#colorscheme#fill` fallback)
- API: `palette#themes`, `palette#load`, `spec#load`, `config#module_enabled`, `color#blend_hex`
- User overrides: transparent, italic comments, palette overrides, group link overrides
- `:GithubThemeReload` (no-args + with-arg), `:GithubThemeInfo`
- Terminal colors populated correctly

The colors were verified numerically against Python reference implementations of the upstream Lua blend formulas.
