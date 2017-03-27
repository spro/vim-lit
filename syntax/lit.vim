if exists('b:current_syntax') && b:current_syntax == 'lit'
    finish
endif

runtime! syntax/markdown.vim
unlet b:current_syntax

syn clear markdownCode

let syntax_aliases = {
    \'py': 'python'
\}
let b:base_syntax = split(expand('%:t'), '\.')[-2]
if has_key(syntax_aliases, b:base_syntax)
    let b:base_syntax = syntax_aliases[b:base_syntax]
endif

execute 'syn include @base syntax/' . b:base_syntax . '.vim'
syn region inlineBase start='^    \|\t' end='$' contains=@base

let b:current_syntax = "lit"
