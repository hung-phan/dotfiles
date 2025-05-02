#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias chrome-debug-mode="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias tmux="tmux -u"
alias lzd='lazydocker'
alias zshreload=". ~/.zshrc"
alias rg=". ranger"
alias bb="brazil-build"
alias bpc="brazil-package-cache"
alias bba="brazil-build apollo-pkg"
alias bre="brazil-runtime-exec"
alias brc="brazil-recursive-cmd"
alias bws="brazil ws"
alias bwsuse="bws use --gitMode -p"
alias bwscreate="bws create -n"
alias brc"brazil-recursive-cmd"
alias bbr="brc brazil-build"
alias bball="brc --allPackages"
alias bbb="brc --allPackages brazil-build"
alias bbra="bbr apollo-pkg"
alias bcc="bpc clean --days 0 --keepCacheHours 0 && bpc stop && bws clean && bpc start"
alias q="~/.local/bin/q"

export EDITOR=vim
export VISUAL=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# kubectl
alias kc=kubectl

# go
export GOPATH=$HOME/Desktop/workarea/gocode
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"

# Toolbox
export PATH=$HOME/.toolbox/bin:$PATH
export BRAZIL_BUILD_HOME=~/.toolbox

# Android
export ANDROID_HOME=~/Library/Android/sdk 
export PATH=$ANDROID_HOME/platform-tools:$PATH

# rupa/z command
. /opt/homebrew/Cellar/z/1.12/etc/profile.d/z.sh


# change git alias
alias git=hub

update_prezto() {
  cd $ZPREZTODIR
  git stash
  git pull
  git submodule update --init --recursive
  git stash pop
  cd -
}

update_and_cleanup() {
  update_prezto
  brew update
  brew upgrade
  brew cu
  brew cleanup -s
  brew doctor
  cd ~/Library/CloudStorage/Dropbox/Document/Install\ scripts 
  ./bundle_script.sh
  cd -
}

docker_cleanup() {
  docker system prune -f
  docker volume prune -f
}

# prune duplicated entry in PATH to speed up completion
typeset -U PATH


# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END
eval "$(mise activate zsh)"
