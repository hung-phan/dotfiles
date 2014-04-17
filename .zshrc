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
ZSH_THEME="robbyrussell"
#ZSH_THEME="michelebologna"
#ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
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

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

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

alias subl='/home/colorvisa/Editor/Sublime\ Text\ 2/sublime_text'

plugins=(rails git ruby)

source $ZSH/oh-my-zsh.sh

# User configuration
ANDROID_SDK="/home/colorvisa/workarea/tool/android-sdk-linux/tools:/home/colorvisa/workarea/tool/android-sdk-linux/platform-tools:/home/colorvisa/workarea/tool/android-sdk-linux/build-tools"
GOOGLE_APPENGINE="/home/colorvisa/workarea/tool/google_appengine"
export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:${GOOGLE_APPENGINE}:${ANDROID_SDK}:/usr/local/nginx/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
source '/home/colorvisa/.ssh/environment'

# z command
. $HOME/.z-master/z.sh
#. /usr/local/lib/python2.7/dist-packages/Powerline-beta-py2.7.egg/powerline/bindings/zsh/powerline.zsh #powerline

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
