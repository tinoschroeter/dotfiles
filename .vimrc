execute pathogen#infect() 
filetype plugin indent on
set autoindent
set bg=dark
set backspace=2
set encoding=utf-8
set expandtab
set hlsearch
set incsearch
set nocp
set number                          " enable line numbers
set ruler
set shiftwidth=4
set smartindent
set tabstop=4
set expandtab
"set nowrap
"set spell
"set spelllang=de_de
"set spelllang=en_US
set sw=2
set ai
%retab

source ~/.vim/dockerfile.vim 

map <F10> :w!<CR>:!aspell -c %<CR>:e! %<CR>  " spell check aspell
set clipboard=unnamedplus           " interact with linux clipboard
set cul
map <C-n> :NERDTreeToggle<CR>       " toggle NERDTree
map <F5> :MundoToggle<CR>           " toggle the undo graph
let g:mundo_right = 1
set foldenable                      " Enable folders
set foldmethod=marker               " Do the marker folding thing
set laststatus=2                    

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif    

"yaml foo
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 239
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ycm_use_clangd = 0

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
