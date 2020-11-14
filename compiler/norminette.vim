" Vim compiler file
" Compiler:         42 norminette
" Maintainer:       Reach <reach@42paris.fr>
" Latest Revision:  2020-11-07

if exists("current_compiler") | finish | endif
let current_compiler = "norminette"

" if !exists("g:norminette_exec") && exists("g:syntastic_c_norminette_exec")  | let g:norminette_exec=g:syntastic_c_norminette_exec | endif
if !exists("g:norminette_exec") | let g:norminette_exec="~/.norminette/norminette.rb" | endif
let &makeprg=g:norminette_exec

CompilerSet errorformat =%PNorme:\ %f,
CompilerSet errorformat+=%t%.%#\ (line\ %l\\,\ col\ %c):\ %m,
CompilerSet errorformat+=%t%.%#\ (line\ %l):\ %m,
CompilerSet errorformat+=%Q,

CompilerSet errorformat =%P%f:\ KO!,
CompilerSet errorformat+=%.%#(line:\ %l\\,\ col:\ %c):%m,
CompilerSet errorformat+=%.%#(line:\ %l):%m,
CompilerSet errorformat+=%Q,
