![dotfile](dotfile.png)


## zsh
 apt install zsh

 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ## Oh My Zsh
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
 git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
 
 //Simply a FUZZY FINDER IN YOUR TERMINAL!!
 git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install


## vim
 
* gg=G           # formating code
* :set nu!       # hide line Number
* :50            # go to line Number 50
* /search        # search type n for next
* :%s/this/that/ # replace thist with that 
* :66,70s/^/#    # comment line 66 - 70
* :66,70s/^#/    # and reverse
