" autoload/github_theme/groups/syntax.vim
" Port of lua/github-theme/group/syntax.lua
"
" Returns a dict of syntax highlight groups.

" Build { fg, style } dict reading the style key from the user's styles map
" (defaults to 'NONE' so highlight#set emits an explicit reset).
function! s:styled(fg, stl, key) abort
  return { 'fg': a:fg, 'style': get(a:stl, a:key, 'NONE') }
endfunction

function! github_theme#groups#syntax#get(spec, opts) abort
  let l:syn = a:spec.syntax
  let l:stl = get(a:opts, 'styles', {})

  let l:g = {}

  let l:g.Comment     = s:styled(l:syn.comment,     l:stl, 'comments')
  let l:g.Constant    = s:styled(l:syn.const,       l:stl, 'constants')
  let l:g.String      = s:styled(l:syn.string,      l:stl, 'strings')
  let l:g.Character   = { 'link': 'String' }
  let l:g.Number      = s:styled(l:syn.number,      l:stl, 'numbers')
  let l:g.Float       = { 'link': 'Number' }
  let l:g.Boolean     = { 'link': 'Number' }

  let l:g.Identifier  = s:styled(l:syn.ident,       l:stl, 'variables')
  let l:g.Function    = s:styled(l:syn.func,        l:stl, 'functions')

  let l:g.Statement   = s:styled(l:syn.keyword,     l:stl, 'keywords')
  let l:g.Conditional = s:styled(l:syn.conditional, l:stl, 'conditionals')
  let l:g.Repeat      = { 'link': 'Conditional' }
  let l:g.Label       = { 'link': 'Conditional' }

  let l:g.Operator  = s:styled(l:syn.operator, l:stl, 'operators')
  let l:g.Keyword   = s:styled(l:syn.keyword,  l:stl, 'keywords')
  let l:g.Exception = { 'link': 'Keyword' }

  let l:g.PreProc   = { 'fg': l:syn.preproc }
  let l:g.Include   = { 'link': 'PreProc' }
  let l:g.Define    = { 'link': 'PreProc' }
  let l:g.Macro     = { 'link': 'PreProc' }
  let l:g.PreCondit = { 'link': 'PreProc' }

  let l:g.Type         = s:styled(l:syn.type, l:stl, 'types')
  let l:g.StorageClass = { 'link': 'Type' }
  let l:g.Structure    = { 'link': 'Type' }
  let l:g.Typedef      = { 'link': 'Type' }

  let l:g.Special        = { 'fg': a:spec.fg1 }
  let l:g.SpecialChar    = { 'link': 'Special' }
  let l:g.Tag            = { 'link': 'Special' }
  let l:g.Delimiter      = { 'link': 'Special' }
  let l:g.SpecialComment = { 'link': 'Special' }
  let l:g.Debug          = { 'link': 'Special' }

  let l:g.Underlined = { 'style': 'underline' }
  let l:g.Bold       = { 'style': 'bold' }
  let l:g.Italic     = { 'style': 'italic' }

  let l:g.Error = { 'fg': a:spec.diag.error }
  let l:g.Todo  = { 'fg': a:spec.bg1, 'bg': a:spec.diag.info }

  let l:g.qfLineNr   = { 'link': 'LineNr' }
  let l:g.qfFileName = { 'link': 'Directory' }

  let l:g.htmlTag    = { 'fg': l:syn.tag }
  let l:g.xmlAttrib  = { 'link': 'htmlTag' }
  let l:g.xmlTagName = { 'link': 'htmlTag' }

  let l:g.cssBraces        = { 'fg': l:syn.bracket }
  let l:g.cssMedia         = { 'link': 'Keyword' }
  let l:g.cssProp          = { 'link': 'Constant' }
  let l:g.cssPseudoClassId = { 'link': 'Function' }

  let l:g.lessAmpersand    = { 'link': 'Function' }
  let l:g.lessClass        = { 'link': 'Function' }
  let l:g.lessClassCall    = { 'link': 'Function' }
  let l:g.lessCssAttribute = { 'link': 'Constant' }
  let l:g.lessFunction     = { 'link': 'Constant' }
  let l:g.lessVariable     = { 'fg': a:spec.fg1 }

  " Diff
  let l:g.Added       = { 'fg': a:spec.git.add, 'bg': a:spec.diff.add }
  let l:g.Changed     = { 'fg': a:spec.git.changed, 'bg': a:spec.diff.change }
  let l:g.Removed     = { 'fg': a:spec.git.removed, 'bg': a:spec.diff.delete }
  let l:g.diffAdded   = { 'link': 'Added' }
  let l:g.diffChanged = { 'link': 'Changed' }
  let l:g.diffRemoved = { 'link': 'Removed' }
  let l:g.diffOldFile   = { 'fg': a:spec.diag.warn }
  let l:g.diffNewFile   = { 'fg': a:spec.diag.hint }
  let l:g.diffFile      = { 'fg': a:spec.diag.info }
  let l:g.diffLine      = { 'fg': l:syn.builtin2 }
  let l:g.diffIndexLine = { 'fg': l:syn.preproc }

  " Json
  let l:g.jsonKeyword = { 'fg': l:syn.tag }
  let l:g.jsonNull    = { 'link': 'Constant' }

  " Lua
  let l:g.luaFunction = { 'link': 'Keyword' }
  let l:g.luaTable    = {}

  " Yaml
  let l:g.yamlBlockMappingKey = { 'fg': l:syn.tag }
  let l:g.yamlFlowMappingKey  = { 'fg': l:syn.tag }

  return l:g
endfunction
