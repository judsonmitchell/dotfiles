set nocompatible 
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on
set number
set ic
set hls
set lbr
set tabstop=4
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab

filetype indent on
filetype plugin on

set foldmethod=syntax
set nofoldenable 

"Customize the status line to always show, and to
"show the git (fugitive) status
"See http://dailyvim.tumblr.com/post/1048170831/the-status-line
set laststatus=2
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P

set t_Co=256
colors zenburn 

let g:SuperTabDefaultCompletionType = "context"

set smarttab
set autoindent
inoremap jj <ESC>

"Alert for over 80 columns http://stackoverflow.com/a/235970/49359
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"Ensure controlp opens files in new tabs
"See https://github.com/kien/ctrlp.vim/issues/119
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

"Note I'm using gsession.vim for auto sessions
"See https://github.com/c9s/gsession.vim
