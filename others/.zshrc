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
alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias chrome-debug-mode="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias tmux="tmux -u"
alias lzd='lazydocker'
alias zshreload=". ~/.zshrc"
alias rg=". ranger"
alias bb="brazil-build"

export EDITOR=vim
export VISUAL=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# go
export GOPATH=$HOME/Desktop/workarea/gocode
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"

# Toolbox
export PATH=$HOME/.toolbox/bin:$PATH

# rupa/z command
. /opt/homebrew/Cellar/z/1.9/etc/profile.d/z.sh

# virtual python env
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# direnv
eval "$(direnv hook zsh)"

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

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
