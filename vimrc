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
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'ricardovaleriano/vim-github-theme.git'
Bundle 'mikewest/vimroom.git'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim.git'
Bundle 'ap/vim-css-color.git'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'junegunn/goyo.vim'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'vim-scripts/loremipsum'

set number
set ic
set hls
set lbr
set tabstop=4
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab
set spell spelllang=en_us
" set spell check and auto-formatting  md
autocmd BufNewFile,BufRead *.md set spell 
autocmd BufNewFile,BufRead *.md set fo=anw 


"filetype indent on
"filetype plugin on


set foldmethod=syntax
set foldlevelstart=1
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
highlight OverLength ctermbg=gray ctermfg=white guibg=#592929
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

" Rename tabs to show tab number.
" http://superuser.com/a/477221/110797
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" Markdown to HTML  
" See http://net.tutsplus.com/tutorials/other/vim-essential-plugin-markdown-to-html/
nmap <leader>md :%!markdown --html4tags <cr>

"Enable syntax highlighting of markdown files with.md extension http://stackoverflow.com/a/14779012/49359
au BufRead,BufNewFile *.md set filetype=markdown

"Change vim split window command to just ctrl-[direction]; better for ChromeOS terminal.
"from: http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Change split invocation command
set splitbelow
set splitright

"Console.log short cut from https://gist.github.com/nervetattoo/3652878
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p 

" Enable javascript folding as per this plugin https://github.com/jelera/vim-javascript-syntax
" Tutorial here:http://vimcasts.org/episodes/how-to-fold/ 
au FileType javascript call JavaScriptFold()

" Note: the following breaks spellcheck.
" Enable Markdown folding http://stackoverflow.com/a/3842504/49359
"au FileType markdown syn region myMkdHeaderFold
"        \ start="\v^\s*\z(\#{1,6})"
"        \ skip="\v(\n\s*\z1\#)\@="
"        \ end="\v\n(\s*\#)\@="ms=s-1,me=s-1
"        \ fold contains=myMkdHeaderFold
"
"au FileType markdown syn sync fromstart
"au FileType markdown set foldmethod=syntax

" Enable paste toggling https://coderwall.com/p/if9mda
set pastetoggle=<F2>

" Set foldmethod to indent for html files
au FileType html setlocal foldmethod=indent

" Toggle Goyo for distraction-free writing
nnoremap <Leader>G :Goyo<CR>

function! s:goyo_enter()
    set textwidth =80
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
