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

command! Norminette :call NorminetteCompiler()

function! NorminetteCompiler()
	compiler norminette
	silent make % | redraw! | cc
	copen
	compiler gcc
endfunction

" Close quickfix window when closing file
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
