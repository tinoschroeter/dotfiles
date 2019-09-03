#!/usr/bin/env bash

# Path to the bash it configuration
# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='zork'

export GOPATH=$HOME/go

#export HOSTALIASES=/etc/host.aliases

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as .
# export BASH_IT_REMOTE='bash-it'

export BASH_IT="/home/$(whoami)/.bash_it"

export EDITOR="vim"

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

webserver_simple() {
    if [ ! -z $1 ];then
        python3 -m http.server --bind 0.0.0.0 $1
    else
        python3 -m http.server --bind 0.0.0.0 8000
    fi  
}

show() {
    if [[ -z $1 ]];then
        echo "usage: $? file.jpg"
    fi

    descriptor=$(echo $1|awk '{print $2}' FS='.'|tr "[A-Z]" "[a-z]")

    if [ -d $1 ];then
        descriptor="folder"
    fi 
    case $descriptor in

        jpg|png|jpeg|gif|webp)
            eog $1 > /dev/null 2>&1
            ;;  
        pdf)
            evince $1 > /dev/null 2>&1
            ;;  
        folder)
            xdg-open $1 > /dev/null 2>&1
            ;;
        *)
            echo ".$descriptor nicht gefunden"
            ;;  
    esac
}
alias show=show 

# https://github.com/chubin/cheat.sh
cheat() {
    curl "cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9"
}
alias cheat=cheat 

# https://github.com/dutchcoders/transfer.sh/
transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
    echo -e "\n\n"
}
alias transfer=transfer

boilerplate() {
    html() {
        cat << 'EOF' > index.html
<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <title>wow</title>
  <meta name="description" content="awesome new site">
  <meta name="Tino Schroeter" content="SitePoint">
  <link rel="stylesheet" href="assets/css/styles.css?v=1.0">
</head>

<body>
  <script src="assets/js/scripts.js"></script>
</body>
</html>
EOF

mkdir -p assets/css assets/js 
touch assets/css/styles.css assets/js/scripts.js 
}

p5() {
    cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>p5js</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.1/p5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.1/addons/p5.dom.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.1/addons/p5.sound.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <script src="sketch.js"></script>
  </body>
</html>
EOF

cat << 'EOF' > sketch.js
function preload() {
}

function setup() {
    createCanvas(windowWidth, windowHeight);
    //frameRate(30);
}

function draw() {
    background(0);
}

function windowResized() {
    resizeCanvas(windowWidth, windowHeight);
}
EOF

cat << 'EOF' > style.css
html, body {
    margin: 0;
    padding: 0;
    overflow:hidden;
}
EOF
}

arduino() {
    cat << 'EOF' > sketch.ino 
// the setup function runs once when you press reset or power the board
void setup() {
    // initialize digital pin LED_BUILTIN as an output.
    pinMode(LED_BUILTIN, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(1000);                       // wait for a second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    delay(1000);                       // wait for a second
}
EOF
}

case "$1" in
    "html")
        html
        ;;
    "p5")
        p5
        ;;
    "arduino")
        arduino
        ;;
    *)
        echo "$1 ? html / p5 / arduino"
        ;;
esac

}
alias boilerplate=boilerplate

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

alias chefdir='cd ~/work/chef/'
alias workdir='cd ~/work/'
alias dnsdir='cd ~/work/dns/' 

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# auto competion
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# Load Bash It
source "$BASH_IT"/bash_it.sh
export PATH=/bin/lscript:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export PATH=$HOME/.local/bin:$HOME/go/bin:$PATH
