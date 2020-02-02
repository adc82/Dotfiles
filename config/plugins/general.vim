set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let path="~/.config/nvim/bundle"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'bling/vim-airline'                  " Status bar
Plug 'mkitt/tabline.vim'                  " Displays window tabs
Plug 'Townk/vim-autoclose'                " Automatically closes parenthesis and quores
Plug 'docunext/closetag.vim'              " Closes html tags when I type </
"Plug 'scrooloose/nerdtree'                " File explorer
Plug 'scrooloose/nerdcommenter'           " Easy commenting and uncommenting
Plug 'tpope/vim-fugitive'                 " Git integration
Plug 'tpope/vim-surround'                 " Allows easy surrounding of words and text in quotes and such
Plug 'godlygeek/tabular'                  " Don't know what this is or how it got here
Plug 'simeji/winresizer'                  " Easy window resizing
Plug 'vim-scripts/RangeMacro'             " Easily applies macro to a range of lines
Plug 'SirVer/ultisnips'                   " Gotta love your snippets
Plug 'vim-airline/vim-airline-themes'     " Adds a directory of Airline Themes
Plug 'honza/vim-snippets'                 " more snippets
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' } " Fuzy file finder
Plug 'bluz71/vim-moonfly-colors'          " a colorscheme
Plug 'mbbill/undotree'                    " A plugin for visualizing VIM's undo/redo tree
" Plug 'pseewald/vim-anyfold'               " Fold syling
Plug 'mhinz/vim-signify'                  " Version control visualization
Plug 'jparise/vim-graphql'                " GrqphQL highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" language specif plugins
source ~/.config/nvim/config/plugins/java.vim
source ~/.config/nvim/config/plugins/javascript.vim
source ~/.config/nvim/config/plugins/python.vim
source ~/.config/nvim/config/plugins/markdown.vim
source ~/.config/nvim/config/plugins/elixir.vim
source ~/.config/nvim/config/plugins/latex.vim
" source ~/.config/nvim/config/plugins/solidity.vim

function! DoRemote(arg)
UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }     " Async autocomplete

call plug#end()              " required
filetype plugin indent on    " required
