" autoload/github_theme/groups/editor.vim
" Port of lua/github-theme/group/editor.lua
"
" Returns a dict of highlight groups keyed by group name.

function! github_theme#groups#editor#get(spec, opts) abort
  let l:c     = a:spec.palette
  let l:hide  = get(a:opts, 'hide_end_of_buffer', v:true)
  let l:inact = get(a:opts, 'dim_inactive', v:false)
  let l:inv   = get(a:opts, 'inverse', {})
  let l:trans = get(a:opts, 'transparent', v:false)
  let l:dark  = get(a:opts, 'darken', {})
  let l:sts_bg = github_theme#color#to_hex(
    \ github_theme#color#blend(a:spec.bg0, l:c.blue.base, 0.7))

  let l:g = {}

  " bg/fg helpers
  let l:bg1_or_none   = l:trans ? 'NONE' : a:spec.bg1
  let l:bg0_or_none   = l:trans ? 'NONE' : a:spec.bg0
  let l:float_bg      = l:trans ? 'NONE' :
    \ (get(l:dark, 'floats', v:true) ? a:spec.bg0 : a:spec.bg1)
  let l:sidebar_bg    = l:trans ? 'NONE' :
    \ (get(get(l:dark, 'sidebars', {}), 'enable', v:true) ? a:spec.bg0 : a:spec.bg1)
  let l:nc_bg         = l:inact ? a:spec.bg0 : l:bg1_or_none

  let l:g.ColorColumn  = { 'bg': a:spec.bg2 }
  let l:g.Conceal      = { 'fg': a:spec.bg4 }
  let l:g.Cursor       = { 'fg': a:spec.bg1, 'bg': a:spec.fg1 }
  let l:g.lCursor      = { 'link': 'Cursor' }
  let l:g.CursorIM     = { 'link': 'Cursor' }
  let l:g.CursorColumn = { 'link': 'CursorLine' }
  let l:g.CursorLine   = { 'bg': a:spec.bg3 }
  let l:g.Directory    = { 'fg': a:spec.syntax.func }
  let l:g.DiffAdd      = { 'bg': a:spec.diff.add }
  let l:g.DiffChange   = { 'bg': a:spec.diff.change }
  let l:g.DiffDelete   = { 'bg': a:spec.diff.delete }
  let l:g.DiffText     = { 'bg': a:spec.diff.text }
  let l:g.EndOfBuffer  = { 'fg': l:hide ? a:spec.bg1 : a:spec.fg0 }
  let l:g.ErrorMsg     = { 'fg': a:spec.diag.error }
  let l:g.VertSplit    = { 'fg': l:c.border.default }
  let l:g.WinSeparator = { 'fg': l:c.border.default }
  let l:g.Folded       = { 'fg': a:spec.fg3, 'bg': a:spec.bg2 }
  let l:g.FoldColumn   = { 'fg': a:spec.fg3 }
  let l:g.SignColumn   = { 'fg': a:spec.fg3 }
  let l:g.SignColumnSB = { 'link': 'SignColumn' }
  let l:g.Substitute   = { 'fg': a:spec.bg1, 'bg': a:spec.diag.error }
  let l:g.LineNr       = { 'fg': a:spec.fg0 }
  let l:g.CursorLineNr = { 'fg': a:spec.fg1 }

  let l:mp_style = get(l:inv, 'match_paren', v:false) ? 'reverse,bold' : 'bold'
  let l:g.MatchParen = { 'fg': a:spec.fg1, 'bg': l:c.accent.muted, 'style': l:mp_style }

  let l:g.ModeMsg     = { 'fg': a:spec.diag.warn, 'style': 'bold' }
  let l:g.MoreMsg     = { 'fg': a:spec.diag.info, 'style': 'bold' }
  let l:g.NonText     = { 'fg': a:spec.bg4 }
  let l:g.Normal      = { 'fg': a:spec.fg1, 'bg': l:bg1_or_none }
  let l:g.NormalSB    = { 'fg': a:spec.fg1, 'bg': l:sidebar_bg }
  let l:g.NormalNC    = { 'fg': a:spec.fg1, 'bg': l:nc_bg }
  let l:g.NormalFloat = { 'fg': a:spec.fg1, 'bg': l:float_bg }
  let l:g.FloatBorder = { 'fg': l:c.border.default }

  let l:g.Pmenu      = { 'fg': a:spec.fg1, 'bg': a:spec.bg0 }
  let l:g.PmenuSel   = { 'bg': a:spec.sel1 }
  let l:g.PmenuSbar  = { 'link': 'Pmenu' }
  let l:g.PmenuThumb = { 'bg': a:spec.sel0 }
  let l:g.Question   = { 'link': 'MoreMsg' }
  let l:g.QuickFixLine = { 'link': 'CursorLine' }

  let l:g.Search    = get(l:inv, 'search', v:false)
    \ ? { 'style': 'reverse' }
    \ : { 'bg': a:spec.sel2 }
  let l:g.IncSearch = get(l:inv, 'search', v:false)
    \ ? { 'style': 'reverse' }
    \ : { 'fg': l:c.black.bright, 'bg': l:c.orange }
  let l:g.CurSearch = { 'link': 'IncSearch' }

  let l:g.SpecialKey = { 'link': 'NonText' }
  let l:g.SpellBad   = { 'sp': a:spec.diag.error, 'style': 'undercurl' }
  let l:g.SpellCap   = { 'sp': a:spec.diag.warn,  'style': 'undercurl' }
  let l:g.SpellLocal = { 'sp': a:spec.diag.info,  'style': 'undercurl' }
  let l:g.SpellRare  = { 'sp': a:spec.diag.info,  'style': 'undercurl' }

  let l:g.StatusLine   = { 'fg': a:spec.bg0, 'bg': l:sts_bg }
  let l:g.StatusLineNC = { 'fg': a:spec.fg3, 'bg': a:spec.bg0 }
  if get(a:opts, 'hide_nc_statusline', v:true)
    let l:g.StatusLineNC = { 'fg': a:spec.bg1, 'bg': a:spec.bg1,
      \ 'sp': a:spec.bg0, 'style': 'underline' }
  endif

  let l:g.TabLine     = { 'fg': a:spec.fg2, 'bg': a:spec.bg2 }
  let l:g.TabLineFill = { 'bg': a:spec.bg0 }
  let l:g.TabLineSel  = { 'fg': a:spec.bg1, 'bg': a:spec.fg3 }
  let l:g.Title       = { 'fg': a:spec.syntax.builtin2, 'style': 'bold' }

  let l:g.Visual    = get(l:inv, 'visual', v:false)
    \ ? { 'style': 'reverse' }
    \ : { 'bg': a:spec.sel0 }
  let l:g.VisualNOS = get(l:inv, 'visual', v:false)
    \ ? { 'style': 'reverse' }
    \ : { 'link': 'Visual' }

  let l:g.WarningMsg = { 'fg': a:spec.diag.warn }
  let l:g.Whitespace = { 'fg': a:spec.bg3 }
  let l:g.WildMenu   = { 'link': 'Pmenu' }
  let l:g.WinBar     = { 'fg': a:spec.fg3, 'bg': l:bg1_or_none, 'style': 'bold' }
  let l:g.WinBarNC   = { 'fg': a:spec.fg3,
    \ 'bg': l:trans ? 'NONE' : (l:inact ? a:spec.bg0 : a:spec.bg1),
    \ 'style': 'bold' }

  return l:g
endfunction
