" enable filetype plugins
filetype plugin on
filetype indent on
set ruler
set number

set textwidth=80
set wrap
set linebreak
set laststatus=2

set showmatch

set incsearch
" use /\C to overrule it
set ignorecase
" be case-sensitive when contains upper char
set smartcase

set autoindent

set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

" keep spaces from top and bottom
set scrolloff=2

set wildmenu
set wildignore=*.o,*~,*.pyc

set listchars=tab:▹\ ,trail:▵
set list

" TODO: let foldcolumn use the char like this
set fillchars=stl:\ ,stlnc:\ ,vert:\ ,fold:\ ,diff:\ ,

set foldmethod=indent
set foldnestmax=3

" for gq
set formatoptions=

" Ctrl+N
set pumheight=15

set mouse=c

set encoding=utf-8

set tabpagemax=100

syntax on

set cursorline

set colorcolumn=81

let mapleader = ","

" F5 to open NERDTree
nnoremap <silent> <F5> :NERDTree<CR>

" tab
noremap <Leader>t :tabedit <C-R>=expand("%:p:h")<CR>/
" gt: next tab
" gT: previous tab
noremap <Leader><Tab> :tabnext<CR>
noremap <Leader>q :tabprevious<CR>
" ,1 ,2 ,3: go specific tab
for i in range(1, 9)
    exec 'nmap <Leader>'.i.' '.i.'gt'
endfor

" split
" ,v: split window with another file
set splitright
noremap <silent> <Leader>v :vsplit<CR>

" ,h: toggle highlight
set hlsearch
noremap <silent> <Leader>h :set hlsearch!<CR>:set hlsearch?<CR>

" ,p or F12: toggle paste mode
noremap <silent> <Leader>p :set paste!<CR>:set paste?<CR>
set pastetoggle=<F12>

" EasyMotion
map <Leader><Leader> <Plug>(easymotion-prefix)
map <Leader>j <Plug>(easymotion-prefix)j
map <Leader>k <Plug>(easymotion-prefix)k
map <Leader>n <Plug>(easymotion-prefix)n
map <Leader>N <Plug>(easymotion-prefix)N

" ,s: toggle spelling check
" zg: mark word as good
" zb: mark word as bad
" z=: list suggestions
" ]s: move to next
" [s: move to prev
" ]S: move to next bad word
" [S: move to prev bad word
" zug: undo zg
" zub: undo zu
noremap <silent> <Leader>s :set spell!<CR>:set spell?<CR>

" ,f: toggle foldenable
" note the range of actions is only your cursor
" zo: open one fold
" zO: open folds recursively
" zc: close one fold
" zC: close folds recursively
" za: toggle one fold
" zA: toggle folds recursively
" zx: undo manually opened and closed folds
" zX: like zx, also works when cursor is in a fold
" zr: reduce one fold: foldlevel+=1
" zR: reduce all folds: foldlevel=MAX
" zm: fold more: foldlevel-=1
" zM: fold all: foldlevel=0
" zj: move to next fold
" zk: move to prev fold
set nofoldenable
noremap <silent> <Leader>f :set foldenable!<CR>:set foldenable?<CR>

" ,g: toggle registers
noremap <silent> <Leader>g :registers<CR>

" return to last edit position when opening files
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Tabularize
" ref:
" https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt
map t= :Tabularize /=<CR>
map t, :Tabularize /,<CR>
map t: :Tabularize /:<CR>
map t\| :Tabularize /\|<CR>
map t<SPACE>  :Tabularize /\S\+<CR>

" don't backup
set nobackup
set nowb
set noswapfile

" configure backspace so it acts as it should act
set backspace=eol,start,indent

" move smoothly between lines
set whichwrap=b,s,<,>,[,]

" don't redraw while executing macros (good performance config)
set lazyredraw

" UltiSnip
" ref:
" https://github.com/SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" airline-vim & airline-vim-theme
" ref:
" https://github.com/vim-airline/vim-airline
let g:airline_theme='base16'

" ctags
" Ctrl-] Jump to the tag underneath the cursor
" Ctrl-t Jump back up in the tag stack
" :ts <tag> <RET> Search for a particular tag
" :tn Go to the next definition for the last tag
" :tp Go to the previous definition for the last tag
" :ts List all of the definitions of the last tag
" F2 create tags file
map <F2> :!ctags -R -f ~/dev/tags --c++-kinds=+p --fields=+iaS --extra=+q ~/dev<CR><CR>
set tags=~/dev/tags

" taglist
" ref:
" https://github.com/vim-scripts/taglist.vim
map <F3> :TlistToggle<CR><CR>

" ctrlp
" Ctrl-t Open in new tab
" ref:
" https://github.com/kien/ctrlp.vim
:nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
:nnoremap <silent><Leader><C-t> :q<CR><bar><Leader>q

" jcommenter
" ref:
" https://github.com/vim-scripts/jcommenter.vim
noremap <Leader>cw :call JCommentWriter()<CR>

" nerdcommenter
" <leader>cc Comment out the current line or text selected in visual mode
" <leader>c<space> Toggles the comment state of the selected line(s)
" <leader>cy Same as cc except that the commented line(s) are yanked first.
" ref:
" https://github.com/scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" 1. JavaImp
" :JI generate import statement
" :JIS sort existing import statement
" Ctrl-p auto suggestion
" ref:
" https://github.com/rustushki/JavaImp.vim
" 2. vim-java-unused-imports
" :UnusedImports highlight all unused imports
" :UnusedImportsReset clear the highlights
" :UnusedImportsRemove remove all unused imports
" ref:
" https://github.com/akhaku/vim-java-unused-imports
let g:JavaImpDataDir = $HOME . "/.vim/JavaImp"
let g:JavaImpPaths = $HOME . "/dev"
let g:JavaImpSortPkgSep = 1
let g:JavaImpTopImports = [
    \ 'com\..*',
    \ 'org\..*',
    \ 'java\..*',
    \ 'javax\..*']
" set mark -> remove unused import -> sort -> add blank line after package statement ->
" keep 1 blank line after last import statement -> jump back to mark
nnoremap <silent> <F4> mq <CR> <bar> :JIS<CR> <bar> :%s/package com.*/&\r/ge<CR> <bar> :%s/\(import.*\)\@<=\n\{3,}/\r\r/e<CR> <bar> `q
nnoremap <silent> <F6> :UnusedImportsRemove<CR>
