#!/bin/bash

which git  || { echo "install git"; exit 1; }
which curl || { echo "install curl"; exit 1; }
which vim  || { echo "install vim"; exit 1; }

cd && echo "setup bash it..."
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

tee ~/.bashrc >/dev/null <<EOF
#!/usr/bin/env bash

# Path to the bash it configuration

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='zork'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

export BASH_IT="/home/$(whoami)/.bash_it"

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
#export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on \$HOSTNAME.
#export SHORT_HOSTNAME=\$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on \$USER.
#export SHORT_USER=\${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "\$BASH_IT"/bash_it.sh
export PATH=/bin/lscript:/bin/lscript:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
EOF
if [[ $EUID -eq 0 ]]; then
sed -i 's/\/home//' /root/.bashrc
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## install plugins
echo "setup vim plugins ..."

echo "clone lightline.vim ..."
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
echo "clone nerdtree ..."
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
echo "clone vim-arduino ..."
git clone https://github.com/stevearc/vim-arduino ~/.vim/bundle/vim-arduino
echo "clone vim-commentary ..."
git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary
echo "clone vim-fugitive ..."
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
echo "clone vim-irblack ..."
git clone https://@github.com/wgibbs/vim-irblack.git ~/.vim/bundle/vim-irblack

tee ~/.vimrc >/dev/null <<EOF
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
command W w !sudo tee % > /dev/null " use :W to write file with sudo rights
set foldenable                      " Enable folders
set foldmethod=marker               " Do the marker folding thing
set laststatus=2                    
:colorscheme ir_black
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
EOF

echo "########################################################################################"
echo "TO DO:"
echo 
echo "source .bashrc"
echo "bash_it enable plugin browser docker-compose docker-machine docker extract git ssh todo"
echo
echo "bash_it enable completion defaults docker docker-compose docker-machine git kubectl ssh test_kitchen tmux vagrant virsh virtualbox"
