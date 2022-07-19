# ![dotfile](dotfile.png)

> **Install my new Notebook** or sync my setup between all of my computers. ":computer:"

[![Ansible](https://img.shields.io/badge/Ansible-blue.svg)](https://github.com/ansible/ansible)
[![GitHub Super-Linter](https://github.com/tinoschroeter/dotfiles/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/tinoschroeter/dotfiles/actions/workflows/linter.yml)
![last-commit](https://img.shields.io/github/last-commit/tinoschroeter/dotfiles.svg?style=flat)

```shell
  git clone https://github.com/tinoschroeter/dotfiles.git \
  && cd dotfiles \
  && ./setup

  gpg password.txt.gpg
  source ~/.zshrc
  nvm install 16 # install nodejs 16
  ~./secrets # stored in bitwarden
```

```shell
  # This Setup is idempotent, you can run it as often you want.
  ./setup run
```

## Ansible Tree

```shell
.
├── ansible.cfg
├── inventory
├── roles
│   ├── dotfiles
│   │   └── tasks
│   │       └── main.yaml
│   ├── folder
│   │   └── tasks
│   │       └── main.yaml
│   ├── npm
│   │   └── tasks
│   │       └── main.yaml
│   ├── pip
│   │   └── tasks
│   │       └── main.yaml
│   ├── software
│   │   └── tasks
│   │       └── main.yaml
│   ├── system
│   │   └── tasks
│   │       └── main.yaml
│   ├── vim
│   │   └── tasks
│   │       └── main.yaml
│   ├── vm
│   │   └── tasks
│   │       └── main.yaml
│   └── zsh
│       └── tasks
│           └── main.yaml
└── site.yaml
```

## Roles

<details>
  <summary>folder</summary>

* Setup [roles/folder/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/folder/tasks/main.yaml)
  * create folder structure

</details>

<details>
  <summary>software</summary>
  
* Setup [roles/software/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/software/tasks/main.yaml)
  * install docker
  * Install [utility packages](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/software/tasks/main.yaml#L21-L49)
  * Install aws cli
  * Install skaffold
  * Install kubens
  * Install Minikube
  * Install kubectl
  * Install terraform
  * Install helm3
  * Install velero
  * Install argocd
  * Install argo
  * Install nvm (Node.js Version Manager)
  * Install Slack
  * Instal help cheat.sh script

</details>

<details>
  <summary>system</summary>

* Setup [roles/system/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/system/tasks/main.yaml)
  * Set timezone to Europe/Berlin
  * Set login shell to zsh

</details>

<details>
  <summary>zsh</summary>

* Setup [roles/zsh/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/zsh/tasks/main.yaml)
  * Install zsh
  * Install Oh My Zsh
  * setup some plugins

</details>

<details>
  <summary>vim</summary>

* Setup [roles/vim/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/vim/tasks/main.yaml)
  * Install vim
  * Setup vim plugins

</details>

<details>
  <summary>dotfiles</summary>

* Setup [roles/dotfiles/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/dotfiles/tasks/main.yaml)
  * put .zshrc in place
  * put .vimrc in place

</details>

<details>
  <summary>npm</summary>

* Setup [roles/npm/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/npm/tasks/main.yaml)
  * install global npm packages

</details>

<details>
  <summary>pip</summary>

* Setup [roles/pip/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/pip/tasks/main.yaml)
  * install pip packages

</details>

<details>
  <summary>vm</summary>

* Setup [roles/vm/tasks/main.yaml](https://github.com/tinoschroeter/dotfiles/blob/master/playbook/roles/vm/tasks/main.yaml)
  * Install virtualbox
  * Install vagrant

</details>

## vim
```shell
gg=G                        # formating code
:set nu!                    # hide line Number
:50                         # go to line Number 50
/search                     # search type n for next
:%s/this/that/              # replace thist with that
:66,70s/^/#                 # comment line 66 - 70
:66,70s/^#/                 # and reverse
[ctrl] +n or [ctrl] + p key # auto completion
```

## helper scripts

```bash
help() {
    /usr/local/bin/cht.sh
}

spell() {
    /usr/local/bin/spell.sh
}

reload() {
    source ~/.zshrc
}
```

![help command](docs/help.gif)
