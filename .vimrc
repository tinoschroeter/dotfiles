execute pathogen#infect() 
set autoindent
set bg=dark
set paste
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
set softtabstop=4
set tabstop=4
set clipboard=unnamedplus           " interact with linux clipboard
set cul
syntax on                           " enable sytax highlighting
filetype plugin indent on
map <C-n> :NERDTreeToggle<CR>       " toggle NERDTree
map <C-u> :ArduinoUpload<CR>        " easy upload to arduino board
set foldenable                      " Enable folders
set foldmethod=marker               " Do the marker folding thing
set laststatus=2                    
:colorscheme ir_black
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
