set nocompatible
filetype off
syntax on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic.git'
Bundle 'c9s/gsession.vim.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
Bundle 'ricardovaleriano/vim-github-theme.git'
Bundle 'mikewest/vimroom.git'

set number
set ic
set hls
set lbr
set tabstop=4
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab

"filetype indent on
"filetype plugin on

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

"http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful
"Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Keep undo info after closing
set undofile

"Autosave session with gsession.vim
let g:autosave_session = 1

