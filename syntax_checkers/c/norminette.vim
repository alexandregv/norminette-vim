"============================================================================
"File:        norminette.vim
"Description: Syntax checking plugin for 42School norminette (v2)
"Maintainer:  Reach <reach at 42paris dot fr>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_c_norminette_checker')
    finish
endif
let g:loaded_syntastic_c_norminette_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_c_norminette_IsAvailable() dict
    return executable(self.getExec())
endfunction

function! SyntaxCheckers_c_norminette_GetLocList() dict
    let makeprg = self.makeprgBuild({})

    let errorformat =
        \ '%PNorme: %f,' .
        \ '%t%.%# (line %l\, col %c): %m,' .
        \ '%t%.%# (line %l): %m,' .
        \ '%Q,' .
        \ '%P%f: KO!,' .
        \ '%.%#(line: %l\, col: %c):%m,' .
        \ '%.%#(line: %l):%m,' .
        \ '%Q,'

    let env = { 'RUBYOPT': '-W0' }

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'env': env,
        \ 'Preprocess': 'Norminette_vim_preprocess' })
endfunction

function! Norminette_vim_preprocess(errors) abort " {{{2
     return map(copy(map(copy(a:errors),
         \ 'substitute(v:val, "Error:", "Error (line 1):", "")')),
         \ 'substitute(v:val, "Warning:", "Warning (line 1):", "")')
endfunction " }}}2

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'c',
    \ 'name': 'norminette',
    \ 'exec': 'norminette' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 ts=4 :
