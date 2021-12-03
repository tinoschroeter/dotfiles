![dotfile](dotfile.png)

## Install Nodebook :computer:
```shell
  git clone https://github.com/tinoschroeter/dotfiles.git \
  && cd dotfiles \
  && ./setup
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
│   │       └── npm.yaml
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

  * Setup
    * create folter structure

</details>

<details>
  <summary>software</summary>
  
  * Setup
    * install docker
    * Install utility packages
    * Install aws cli
    * Install skaffold
    * Install kubectl
    * Install nvm (Node Version Manager)
    * Install Slack

</details>

<details>
  <summary>system</summary>

  * Setup
    * Set timezone to Europe/Berlin

</details>

<details>
  <summary>zsh</summary>

  * Setup
    * Install zsh
    * Install Oh My Zsh
    * setup some plugins

</details>

<details>
  <summary>vim</summary>

  * Setup
    * Install vim 
    * Setup vim plugins

</details>

<details>
  <summary>dotfiles</summary>

  * Setup
    * put .zshrc in place
    * put .vimrc in place

</details>

<details>
  <summary>npm</summary>

  * Setup
    * install global npm packages

</details>

<details>
  <summary>vm</summary>

  * Setup
    * Install virtualbox
    * Install vagrant

</details>
