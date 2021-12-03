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

## vim
* gg=G           # formating code
* :set nu!       # hide line Number
* :50            # go to line Number 50
* /search        # search type n for next
* :%s/this/that/ # replace thist with that 
* :66,70s/^/#    # comment line 66 - 70
* :66,70s/^#/    # and reverse
