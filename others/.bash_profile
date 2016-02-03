[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

case $- in *i*) . ~/.bashrc;; esac
