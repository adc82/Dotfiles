" Adam Collins
" adc613@gmail.com
" Welcome to my beautiful and continually evolving .vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Lokaltog/vim-powerline'             " Makes my status bar cool and useful in vim
Plugin 'SirVer/ultisnips'                   " Allows me to create autogenerated snippets of code 
Plugin 'Townk/vim-autoclose'                " Automatically closes parenthesis and quores
Plugin 'Valloric/YouCompleteMe'             " Word autocompletion
Plugin 'VundleVim/Vundle.vim'               " Plugin manager 
Plugin 'docunext/closetag.vim'              " Closes html tags when I type </ 
Plugin 'honza/vim-snippets'                 " Dependency for UltiSnips
Plugin 'nvie/vim-flake8'                    " Python lynter 
Plugin 'rstacruz/sparkup'                   " Not sure what this does or how it got here
Plugin 'scrooloose/nerdtree'                " File explorer 
Plugin 'scrooloose/syntastic'               " Syntax lynter 
Plugin 'scrooloose/nerdcommenter'           " Easy commenting and uncommenting 
Plugin 'tpope/vim-fugitive'                 " Git integration
Plugin 'tpope/vim-surround'                 " Allows easy surrounding of words and text in quotes and such 
Plugin 'godlygeek/tabular'                  " Don't know what this is or how it got here 
Plugin 'plasticboy/vim-markdown'            " Markdown plugin, not sure if it does anything
Plugin 'suan/vim-instant-markdown'          " Allows me to view my markdwon edits in chrome as it happens 
Plugin 'ctrlpvim/ctrlp.vim'                 " Fuzzy file finder 
Plugin 'tpope/vim-obsession'                " Maintains vim sessions through a system reboot
Plugin 'simeji/winresizer'                  " Easy window resizing
Plugin 'jelera/vim-javascript-syntax'       " JavaScript syntax highlighting
Plugin 'pangloss/vim-javascript'            " Javascript indenting
Plugin 'nathanaelkane/vim-indent-guides'    " Javascript indenting
Plugin 'vim-scripts/RangeMacro'             " Easily applies macro to a range of lines


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set softtabstop=4 
set relativenumber " enables relative number
set number  " shows the number of current line 
set autoindent "automatically indents
set tabstop=4
set expandtab
set tw=79   "width of the document (used by GD)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80 " colors 80th collumn
set ignorecase "ignore case in search
set smartcase  "becomes case sensitive once you use a case 
set hlsearch "highlights search
set incsearch "searches while typing


" turns on highlighted syntax not sure what the other shit does
filetype indent on
syntax on
autocmd! bufwritepost .vimrc source %

" allows me to copy and past outside of terminal
set clipboard=unnamed

let mapleader = ","

" move between pane using control keys and H,J,K,L 
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h

" resize panes
nnoremap <silent> <Leader>+ :resize +5 <CR>
nnoremap <silent> <Leader>= :resize -5 <CR>


" move between tabs wit , M or N ( left and right respectively)
map <C-n> <esc>:tabprevious<CR>
map <C-p> <esc>:tabnext<CR>

" Alphabetically sort lines of code in visual mode
vnoremap <Leader>a :sort<CR>

" allows me edit the tabs in blocks of code 
vnoremap < <gv 
vnoremap > >gv

" easier formatting of paragraphs remaps when you go above 80 characters
vmap Q gq
nmap Q gqap

" Toggle NERDTree 
map <Leader>f  :NERDTreeToggle<cr>


" remove search highlted words
nnoremap <CR> :noh <cr>

"Syntastic recommended settings 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_html_tidy_exec = 'tidy5'

" syntastic highlighting 
highlight SyntasticErrorSign guibg=#000000 guifg=#ffffff
highlight SyntasticWarningSign guibg=#000000 guifg=#ffffff
highlight SyntasticErrorLine guibg=#000000 guifg=#ffffff
highlight SyntasticWarningLine guibg=#000000 guifg=#ffffff
highlight SyntasticError guibg=#000000 guifg=#ffffff
highlight SyntasticWarning guibg=#000000 guifg=#ffffff

" Flake8- python syntax linter
autocmd VimEnter *.py call Flake8()
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1 " shows warning signs next to the number line

" Sets error markersfor all the differnt error types
let g:flake8_error_marker="EE" 
let g:flake8_warning_marker=">>"
let g:flake8_pyflake_marker=">>"
let g:flake8_complexity_marker=">>"
let g:flake8_naming_marker=">>"

" vim-flake8 plugin highlighting
highlight flake8_hi guibg=#000000 guifg=#ffffff
highlight link Flake8_Error         flake8
highlight link Flake8_Warning       flake8
highlight link Flake8_Complexity    flake8
highlight link Flake8_Naming        flake8
highlight link Flake8_PyFlake       flake8

" Change indentation for html
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" close tag for html plugin
autocmd FileType html let b:closetag_html_style=1

" Spell checking in html files
autocmd FileType html setlocal spell spelllang=en_us

" disables tab completion for you complete me
let g:ycm_key_list_select_completion=['<C-j>']
let g:ycm_key_list_previous_completion=['<C-k>']

" removes all files from the black list for use in markdown
let g:ycm_filetype_blacklist = {}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" UltiSnips searches .vim/UltiSnips directory
let g:UltiSnipsSnippetDirectories=["/Users/AdamC/.vim/UltiSnips"]

" Powerline fonts
if has("gui_running")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
                set guifont=Inconsolata\ for\ Powerline
        endif
endif

" Powerline
let g:Powerline_symbols = 'unicode'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=screen-256color
set termencoding=utf-8
set nocompatible
set laststatus=2

" Color scheme in ~/.vim/colors/
colorscheme mustang

" javascript settings 
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" markdown settings
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal spell spelllang=en_us

" Ctrlp fuzzy file finder
let g:ctrlp_map = '<C-c>' " remaps CtrlP to leader p
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r' " sets the working diirectory to the nearest ancestor of current file that contains a .git directory 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " excludes all files in .gitnignore

" winresizer plugin mapping
let g:winresizer_start_key='<Leader>r'

" vim-mardown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" function to let me do math in vim
vnoremap ;bc "ey:call CalcBC()<CR>
function! CalcBC()
  let has_equal = 0
  " remove newlines and trailing spaces
  let @e = substitute (@e, "\n", "", "g")
  let @e = substitute (@e, '\s*$', "", "g")
  " if we end with an equal, strip, and remember for output
  if @e =~ "=$"
    let @e = substitute (@e, '=$', "", "")
    let has_equal = 1
  endif
  " sub common func names for bc equivalent
  let @e = substitute (@e, '\csin\s*(', "s (", "")
  let @e = substitute (@e, '\ccos\s*(', "c (", "")
  let @e = substitute (@e, '\catan\s*(', "a (", "")
  let @e = substitute (@e, "\cln\s*(", "l (", "")
  " escape chars for shell
  let @e = escape (@e, '*()')
  " run bc, strip newline
  let answer = substitute (system ("echo " . @e . " \| bc -l"), "\n", "", "")
  " append answer or echo
  if has_equal == 1
    normal `>
    exec "normal a" . answer
  else
    echo "answer = " . answer
  endif
endfunction

