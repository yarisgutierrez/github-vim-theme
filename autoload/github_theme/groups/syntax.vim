" autoload/github_theme/groups/syntax.vim
" Port of lua/github-theme/group/syntax.lua
"
" Returns a dict of syntax highlight groups.

function! github_theme#groups#syntax#get(spec, opts) abort
  let l:syn = a:spec.syntax
  let l:stl = get(a:opts, 'styles', {})

  let l:g = {}

  let l:g.Comment     = { 'fg': l:syn.comment, 'style': get(l:stl, 'comments', 'NONE') }
  let l:g.Constant    = { 'fg': l:syn.const, 'style': get(l:stl, 'constants', 'NONE') }
  let l:g.String      = { 'fg': l:syn.string, 'style': get(l:stl, 'strings', 'NONE') }
  let l:g.Character   = { 'link': 'String' }
  let l:g.Number      = { 'fg': l:syn.number, 'style': get(l:stl, 'numbers', 'NONE') }
  let l:g.Float       = { 'link': 'Number' }
  let l:g.Boolean     = { 'link': 'Number' }

  let l:g.Identifier  = { 'fg': l:syn.ident, 'style': get(l:stl, 'variables', 'NONE') }
  let l:g.Function    = { 'fg': l:syn.func, 'style': get(l:stl, 'functions', 'NONE') }

  let l:g.Statement   = { 'fg': l:syn.keyword, 'style': get(l:stl, 'keywords', 'NONE') }
  let l:g.Conditional = { 'fg': l:syn.conditional, 'style': get(l:stl, 'conditionals', 'NONE') }
  let l:g.Repeat      = { 'link': 'Conditional' }
  let l:g.Label       = { 'link': 'Conditional' }

  let l:g.Operator  = { 'fg': l:syn.operator, 'style': get(l:stl, 'operators', 'NONE') }
  let l:g.Keyword   = { 'fg': l:syn.keyword, 'style': get(l:stl, 'keywords', 'NONE') }
  let l:g.Exception = { 'link': 'Keyword' }

  let l:g.PreProc   = { 'fg': l:syn.preproc }
  let l:g.Include   = { 'link': 'PreProc' }
  let l:g.Define    = { 'link': 'PreProc' }
  let l:g.Macro     = { 'link': 'PreProc' }
  let l:g.PreCondit = { 'link': 'PreProc' }

  let l:g.Type         = { 'fg': l:syn.type, 'style': get(l:stl, 'types', 'NONE') }
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
