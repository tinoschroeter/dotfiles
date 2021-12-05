# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
autoload -U colors; colors

setopt nocorrectall
setopt correct

# Open FAAS
export OPENFAAS_URL="https://openfaas.tino.sh"

# Remote Docker
export DOCKER_HOST=tcp://10.0.1.60:2375

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Krew is the plugin manager for kubectl command-line tool.
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  dnf
  zsh-autosuggestions
  zsh-syntax-highlighting
  aws
  docker
  helm
  knife
  node
  npm
  terraform
  vagrant
  gcloud
  kubectl
  zsh-kubectl-prompt
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# expor tARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# https://blog.confirm.ch/zsh-tips-changing-directories/
setopt auto_cd

# https://github.com/rupa/z
. ~/.zsh/z.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Command line alias to start the browser-sync server
alias serve="browser-sync start --server --files ."

# kubectl aliase
alias kls="kubectl get all"
alias k="kubectl"
alias ks="kubens"
alias ska="skaffold"
alias kv="kubeval"

# Velero Backup
alias v=velero

# Terraform
alias t="terraform"

# Docker
alias d="docker"

#ssh tunnel k3s
tunnel="ssh -p 22 -L 6443:localhost:6443 root@tino.sh"

kx () {
if [ -z "$1" ];then
    kubectl config get-contexts|lolcat
else
    kubectl config use-context "$1"
fi
}

# export Multiple Kubernetes Clusters to KUBECONFIG
export KUBECONFIG="$(ls -m ~/.kube/custom-contexts/*|tr -d '\n'|sed 's/,/:/g'):/home/${USER}/.kube/config"

# Auto completion
source <(kubectl completion zsh)
complete -F __start_kubectl k

# Velero completion
source <(velero completion zsh)
complete -F __start_velero v

# ssh completion
h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi

if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi

#
RPROMPT='%{$bg[$([[ "$(kubectl config current-context)" =~ "PRODUCTION" ]] && \
echo red || echo green)]$fg[white]%}[$ZSH_KUBECTL_PROMPT]%{$reset_color%}'

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
