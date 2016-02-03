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

alias emacs="/opt/homebrew-cask/Caskroom/emacs/24.5-1/Emacs.app/Contents/MacOS/Emacs -nw"
alias tmux="tmux -u"

export NVM_DIR=~/.nvm

source $(brew --prefix nvm)/nvm.sh

export EDITOR=emacs
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# virtual python env
eval "$(pyenv init -)"

# java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
