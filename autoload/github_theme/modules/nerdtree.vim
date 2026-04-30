" autoload/github_theme/modules/nerdtree.vim
" Groups for preservim/nerdtree

function! github_theme#modules#nerdtree#get(spec, opts) abort
  let l:c = a:spec.palette
  return {
    \ 'NERDTreeDir':         { 'fg': a:spec.syntax.func, 'style': 'bold' },
    \ 'NERDTreeDirSlash':    { 'fg': a:spec.syntax.func },
    \ 'NERDTreeOpenable':    { 'fg': a:spec.syntax.func },
    \ 'NERDTreeClosable':    { 'fg': a:spec.syntax.func },
    \ 'NERDTreeFile':        { 'fg': a:spec.fg1 },
    \ 'NERDTreeExecFile':    { 'fg': a:spec.git.add },
    \ 'NERDTreeLink':        { 'fg': a:spec.syntax.const, 'style': 'italic' },
    \ 'NERDTreeLinkTarget':  { 'fg': a:spec.syntax.string },
    \ 'NERDTreeLinkFile':    { 'fg': a:spec.fg0 },
    \ 'NERDTreeLinkDir':     { 'fg': a:spec.syntax.func },
    \ 'NERDTreeCWD':         { 'fg': a:spec.syntax.const, 'style': 'bold' },
    \ 'NERDTreeUp':          { 'fg': a:spec.fg0 },
    \ 'NERDTreeHelp':        { 'fg': a:spec.fg2 },
    \ 'NERDTreeToggleOn':    { 'fg': a:spec.git.add },
    \ 'NERDTreeToggleOff':   { 'fg': a:spec.git.removed },
    \ 'NERDTreeFlags':       { 'fg': a:spec.fg2 },
    \ 'NERDTreeBookmark':    { 'fg': a:spec.syntax.keyword },
    \ 'NERDTreeBookmarkName':{ 'fg': a:spec.syntax.const },
    \ 'NERDTreeGitStatusModified':    { 'fg': a:spec.git.changed },
    \ 'NERDTreeGitStatusStaged':      { 'fg': a:spec.git.add },
    \ 'NERDTreeGitStatusUntracked':   { 'fg': a:spec.git.add },
    \ 'NERDTreeGitStatusRenamed':     { 'fg': a:spec.git.changed },
    \ 'NERDTreeGitStatusDeleted':     { 'fg': a:spec.git.removed },
    \ 'NERDTreeGitStatusUnmerged':    { 'fg': a:spec.git.conflict },
    \ 'NERDTreeGitStatusDirDirty':    { 'fg': a:spec.git.changed },
    \ 'NERDTreeGitStatusDirClean':    { 'fg': a:spec.fg2 },
    \ 'NERDTreeGitStatusIgnored':     { 'fg': a:spec.git.ignored }
  \ }
endfunction
