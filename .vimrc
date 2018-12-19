""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"			here begins my custom VIMRC
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "-"
let maplocalleader = "\\"
set background=dark

inoremap jk <esc>
inoremap JK <esc>
inoremap jK <esc>

au BufNewFile,BufRead *.jade set filetype=jade

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

autocmd Filetype html setlocal ts=2 sw=2 tabstop=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 
autocmd Filetype jade setlocal tabstop=2 sts=0 

augroup comments
	autocmd FileType cpp,c nnoremap <buffer> <localleader>C ^xx$<esc>
	autocmd FileType cpp,c nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType python,sh nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType python,vim,sh nnoremap <buffer> <localleader>C ^x$<esc>
augroup END

augroup ifstatements
	autocmd FileType python :iabbrev <buffer> iff if:<left>
	autocmd FileType c,cpp :iabbrev <buffer> iff if()<left>
	autocmd FileType cpp :iabbrev <buffer> cout std::cout
	autocmd FileType cpp :iabbrev <buffer> endl std::endl
augroup END


" not sure what this does?
let loaded_matchparen = 1

" make the backspace key work again?
set backspace=indent,eol,start

" show status bar all the time
set laststatus=2

" define a few custom preference settings
set autoindent
set noexpandtab
set relativenumber
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set textwidth=80

" enable syntax in documents
syntax enable

""""""""""""""""""""""""""""""
" set the status bar
""""""""""""""""""""""""""""""
set statusline=\ %f					" filename 
set statusline+=\ -				" buffer
set statusline+=\ FileType:\ 
set statusline+=%y\ 			" filetype
set statusline+=%=				" right align text
set statusline+=%l/%-5L 		" line numbers


""""""""""""""""""""""""""""""
" some custom mappings
""""""""""""""""""""""""""""""
" easy editing and sourcing of vimrc
noremap <leader>ev :edit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" capitalize a word
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUea<esc>

" mappings for switching windows?
nnoremap <leader>w <c-w><c-w>
nnoremap <leader>mw <c-w>\|
nnoremap <leader>ns <c-w>=

" switching tabs is easier
nnoremap tg gT

nnoremap <leader>hs :setlocal hlsearch!<cr>

" incsearch highlights the patten matches as the pattern is searched
set incsearch

nnoremap J <c-d>
nnoremap K <c-u>

" remove the banner in the buildint netrw fileviewer
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 20

" nnoremap <leader>t :Vexplore<cr>
nnoremap <leader>t :tabnew . <bar> :set relativenumber<bar> :set number <bar> :tabm 0 <cr>

" adjust size of split screen more easily
nnoremap ++ <c-w><
nnoremap -- <c-w>>


" Persistent Undo
let vimDir='$HOME/.vim' 
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

set undolevels=50

set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.bak,*.exe

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" used to have it highlight the row and column 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set cursorline		
" set colorcolumn=+1
" set viminfo='100,<1000,s100


