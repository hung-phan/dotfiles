# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source '/home/colorvisa/.ssh/environment'

# User configuration
#
# proxy function
squid_proxy_on() {
    export http_proxy="http://127.0.0.1:3128/"
    export https_proxy="https://127.0.0.1:3128/"
    export ftp_proxy="ftp://127.0.0.1:3128/"
    export socks_proxy="socks://127.0.0.1:3128/"
}
switch_home() {
   sudo cp /etc/squid3/home/squid.conf /etc/squid3/squid.conf
   sudo service squid3 restart
}
switch_rmit() {
    sudo cp /etc/squid3/rmit/squid.conf /etc/squid3/squid.conf
    sudo service squid3 restart
}
proxy_on() {
    local username=''
    local password=''
    local proxy_server=''
    vared -p "username: " username
    echo -n "password: "
    read -s password
    vared -p "proxy server: " proxy_server
    export http_proxy="http://$username:$password@$proxy_server:8080/"
    export https_proxy="https://$username:$password@$proxy_server:8080/"
    export ftp_proxy="ftp://$username:$password:$proxy_server:21/"
    echo -e "\nProxy environment variable set."
}
proxy_off() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    echo -e "\nProxy environment variable removed."
}
# lazy as fuck for git
glpush() {
    local message=''
    vared -p "Message to commit: " message
    git add -A
    git commit -m "$message"
    git push
}
glpull() {
    local message=''
    vared -p "Message to commit: " message
    git add -A
    git commit -m "$message"
    git pull
}
# download server
aria_download() {
    cd $HOME/Downloads
    touch session.txt
    aria2c --enable-rpc --rpc-listen-all --save-session=session.txt -isession.txt
}
# dual monitor
dual_monitor() {
    xrandr --output VGA1 --right-of LVDS1
}
# single monitor
single_monitor() {
    xrandr --output VGA1 --off
}
# tmux
otmux() {
    tmux -2
}
# stop apache
apache_off() {
   sudo /etc/init.d/apache2 stop
}

# editor
alias subl='/home/colorvisa/Editor/Sublime\ Text\ 2/sublime_text'
# multiplex
alias tmux="tmux -2"
alias restart="sudo shutdown -r now"
alias shutdown="sudo shutdown now"

source '/home/colorvisa/.ssh/environment'
# z command
. $HOME/.z-master/z.sh

export PATH="/home/colorvisa/.gem/ruby/2.1.0/bin:/usr/local/bin:/home/colorvisa/.gem/ruby/2.1.0/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
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
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# set tmux as default
if [[ ! -n $TMUX ]]; then
    tmux
fi
