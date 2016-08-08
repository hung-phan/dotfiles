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

# rupa/z command
. /usr/local/Cellar/z/1.9/etc/profile.d/z.sh

alias emacs="/usr/local/Caskroom/emacs/24.5-1/Emacs.app/Contents/MacOS/Emacs -nw"
alias chrome-debug-mode="/usr/local/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias tmux="tmux -u"

export NVM_DIR=~/.nvm

source $(brew --prefix nvm)/nvm.sh

export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# virtual python env
pyenv() {
  eval "$(command pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv "$@"
}

# rbenv
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

# hub alias
eval "$(hub alias -s)"
