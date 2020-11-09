" Vim compiler file
" Compiler:         42 norminette
" Maintainer:       Reach <reach@42paris.fr>
" Latest Revision:  2020-11-07

if exists("current_compiler") | finish | endif
let current_compiler = "norminette"

CompilerSet makeprg=~/.norminette/norminette.rb

CompilerSet errorformat =%-PNorme:\ %f,
CompilerSet errorformat+=%t%.%#\ (line\ %l\\,\ col\ %c):\ %m,
CompilerSet errorformat+=%t%.%#\ (line\ %l):\ %m,
CompilerSet errorformat+=%t%.%#:\ %m,
