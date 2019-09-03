![dotfile](dotfile.png)

## alias

    * boilerplate p5 / Arduino / html    
    * webserver_simple
    * transfer file.sh
    * cheat.sh
    * chefdir
    * workdir
    * dnsdir
    * show

## vim
 
    * gg=G           # formating code
    * :set nu!       # hide line Number
    * :50            # go to line Number 50
    * /search        # search type n for next
    * :%s/this/that/ # replace thist with that 
    * :66,70s/^/#    # comment line 66 - 70
    * :66,70s/^#/    # and reverse

```sh
cd && echo "setup bash it..."
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

cp .bashrc ~/.bashrc 

if [[ $EUID -eq 0 ]]; then
sed -i 's/\/home//' /root/.bashrc
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## install plugins
echo "setup vim plugins ..."

echo "clone lightline.vim ..."
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
echo "clone Arduino"
git clone https://github.com/tclem/vim-arduino.git ~/.vim/bundle/vim-arduino
echo "clone vim-arduino-syntax"
git clone https://github.com/sudar/vim-arduino-syntax ~/.vim/bundle/vim-arduino-syntax
echo "clone nerdtree ..."
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
echo "clone vim-commentary ..."
git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary
echo "clone vim-fugitive ..."
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
echo "clone vim-irblack ..."
git clone https://@github.com/wgibbs/vim-irblack.git ~/.vim/bundle/vim-irblack
echo "clone YouCompleteMe"
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

echo "install YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
sudo apt install build-essential cmake python3-dev
python3 install.py --clang-completer

cp .vimrc ~/.vimrc 

echo "########################################################################################"
echo "TO DO:"
echo 
echo "source .bashrc"
echo "bash_it enable plugin browser docker-compose docker-machine docker extract git ssh"
echo
echo "bash_it enable completion defaults docker docker-compose docker-machine git kubectl ssh test_kitchen tmux vagrant virsh virtualbox"
```
