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

## roles

<details>
  <summary>folder</summary>

  ### folder
  * create folter structure

</details>

<details>
  <summary>software</summary>

  ### software
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

  ### system
  * Set timezone to Europe/Berlin

</details>

<details>
  <summary>zsh</summary>

  ### zsh
  * Install zsh
  * Install Oh My Zsh
  * setup some plugins

</details>

<details>
  <summary>vim</summary>

  ### vim  have a look again
  * Install vim 
  * Setup vim plugins

</details>

<details>
  <summary>dotfiles</summary>

  ### dotfiles
  * put .zshrc in place
  * put .vimrc in place

</details>

<details>
  <summary>npm</summary>

  ### npm
  * install global npm packages

</details>

<details>
  <summary>vm</summary>

  ### Virtual Machine
  * Install virtualbox
  * Install vagrant

</details>

