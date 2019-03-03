source $VIMRUNTIME/defaults.vim
set t_ut=
set nocompatible              " be iMproved, required
filetype on                  " required
colorscheme badwolf	      " colorscheme
syntax on
set relativenumber
set hlsearch
hi Normal ctermbg=none
highlight NonText ctermbg=none
set t_Co=256
filetype plugin on
filetype indent on	"identitation for different file types

set omnifunc=syntaxcomplete#Complete
imap <c-space> <c-x><c-o>

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
set laststatus=2
set ic
set mouse-=a
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'davidhalter/jedi-vim' " Awesome completition/statistic analysis
			      " library for python
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/csscomplete.vim'  "update the built in CSS complete function
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'Yggdroot/indentLine'

function Py3()
	let g:syntastic_python_python_exec = '/usr/bin/python3.7'
endfunction

call Py3()

let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 3
let g:badwolf_css_props_highlight = 1
"let g:ycm_python_binary_path = '/usr/bin/python3.7'
let g:syntastic_python_checkers = ['python']
let g:syntastic_html_checkers = ['w3']
let g:syntastic_htmldjango_checkers = ['w3']

"perl checkers
let g:syntastic_perl_checkers = ['podchecker']


let g:syntastic_aggregate_errors = 1
let g:ycm_semantic_triggers = {
			\ 'python':['re!\w{2}', 're!\w{*}.', '.']}
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_max_num_candidates = 7
let g:ycm_max_num_identifier_candidates = 7
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"settings for jedi completition


" All of your Plugins must be added before the following line
call vundle#end()            " required

call plug#begin()
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
call plug#end()
filetype plugin indent on    " required

execute pathogen#infect()
call pathogen#helptags()
