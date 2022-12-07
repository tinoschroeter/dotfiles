execute pathogen#infect() 
filetype plugin indent on
set autoindent
set backspace=2
set encoding=utf-8
set expandtab
set hlsearch
set incsearch
set nocp
"set number " enable line numbers
set relativenumber " turn relative line numbers on
set so=999 " Centering with scrolloff (scroll offset) 
set ruler
set shiftwidth=4
set smartindent
set tabstop=4
set expandtab
"set nowrap
set spell
set spelllang=de_de
set spelllang=en_us
set sw=2
set ai
%retab

" color theme
set background=dark

let g:gruvbox_transparent_bg = '1'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_termcolors = 256

" fzf folder
set rtp+=~/.fzf

autocmd vimenter * nested colorscheme gruvbox

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_add_preview_to_completeopt = 'popup'
let g:ycm_auto_hover = 'CursorHold'

"au BufNewFile,BufRead *.ejs set filetype=html " Syntax highlight for .ejs files

set mouse=n " tell vim to recognize mouse commands in "Normal" modes
set ttyfast " improve fluidity of mouse commands, this isn't necessary but I believe improves performance
set nopaste " don't mess up the indenting of pasted text

" settings vim-gitgutter
set updatetime=50

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

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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
          \   'gitbranch': 'gitbranch#name'
          \ },
          \ }
