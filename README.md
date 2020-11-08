# norminette-vim

42 norminette (linter) for vim

## Installation

norminette-vim needs [syntastic](https://github.com/vim-syntastic/syntastic) and the [norminette](https://github.com/42Paris/norminette) to work.  
You will need a plugin manager to install syntastic and norminette-vim. I recommend [vim-plug](https://github.com/junegunn/vim-plug).  

1. If you are not on a 42 mac, install the [norminette](https://github.com/42Paris/norminette#installing-instructions).
2. Install syntastic and norminette-vim with your plugin manager. See exemple below.

With vim-plug, add this to the beginning of your `~/.vimrc` (or `~/.config/nvim/init.vim` for neovim):
```vim
call plug#begin()

Plug 'vim-syntastic/syntastic'
Plug 'alexandregv/norminette-vim'

call plug#end()
```
then restart vim and run `:PlugInstall`

3. Finish [Configuration](#configuration)

## Configuration

Some configuration options are available, here is what I recommend.
```vim
" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['gcc', 'norminette']

" Set the path to norminette (do no set if using norminette of 42 mac)
let g:syntastic_c_norminette_exec = '~/.norminette/norminette.rb'

" Pass custom arguments to norminette (this one ignores 42header)
let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'

" Check errors when opening a file
let g:syntastic_check_on_open = 1

" Enable error list
let g:syntastic_always_populate_loc_list = 1

" Automatically open error list
let g:syntastic_auto_loc_list = 1

" Skip check when closing
let g:syntastic_check_on_wq = 0
```

## Usage

Open any `.c` file and you should see your norm errors (if any!).  
You can open the error list with `:Errors`