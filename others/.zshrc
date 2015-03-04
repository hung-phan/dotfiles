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

alias vim="/opt/homebrew-cask/Caskroom/macvim/7.4-73/MacVim-snapshot-73/MacVim.app/Contents/MacOS/Vim"
alias tmux="tmux -u"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/colorvisa/.rvm/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

cd ..;1
