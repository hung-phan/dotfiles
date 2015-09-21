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

# rupa/z command
. /usr/local/Cellar/z/1.8/etc/profile.d/z.sh

# Customize to your needs...

alias emacs="/opt/homebrew-cask/Caskroom/emacs/24.5-1/Emacs.app/Contents/MacOS/Emacs -nw"
alias vim="nvim"
alias tmux="tmux -u"
alias fuck='$(thefuck $(fc -ln -1))'

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/colorvisa/.rvm/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export NVM_DIR=~/.nvm

source $(brew --prefix nvm)/nvm.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# virtual python env
eval "$(pyenv init -)"

cd ..;1

# java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
