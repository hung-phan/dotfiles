# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#ZSH_THEME="blinks"
#ZSH_THEME="muse"
#ZSH_THEME="sorin"
#ZSH_THEME="candy"
#ZSH_THEME="af-magic"
ZSH_THEME="powerline"
#ZSH_THEME="michelebologna"
#ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

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

# download server
aria_download() {
    cd $HOME/Downloads
    touch session.txt
    squidproxy
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
# settings
plugins=(git)

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/workarea/lib/google_appengine
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

. $HOME/.z-master/z.sh

