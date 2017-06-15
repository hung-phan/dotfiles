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

# quick fix for yarn
export PATH="$PATH:/Users/$(whoami)/.config/yarn/global/node_modules/.bin"

# rupa/z command
. /usr/local/Cellar/z/1.9/etc/profile.d/z.sh

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias chrome-debug-mode="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias tmux="tmux -u"

export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# virtual python env
eval "$(command pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rbenv
eval "$(command rbenv init -)"

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# kubectl
source <(kubectl completion zsh)
alias kc=kubectl

# change git alias
alias git=hub

update_and_cleanup() {
  brew update && brew upgrade && brew cleanup && brew cask cleanup
}
