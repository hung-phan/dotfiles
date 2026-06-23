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
alias vim="nvim"
alias chrome-debug-mode="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias tmux="tmux -u"
alias lzd='lazydocker'
alias zshreload=". ~/.zshrc"
alias rgr=". ranger"
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
alias kiro-cli="/Users/phahng/.local/bin/kiro-cli"

export EDITOR=nvim
export VISUAL=nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Only force a fallback TERM when not inside a terminal that sets its own.
# Ghostty/cmux export TERM=xterm-ghostty and rely on it to load shell-integration
# (cwd reporting, prompt marks, etc.). Forcing xterm-256color breaks that.
if [[ -z "$TERM" || "$TERM" == "dumb" ]]; then
  export TERM=xterm-256color
fi

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

# Claude config
export ECC_CONTEXT_MONITOR_COST_WARNINGS=off
export HEADROOM_TELEMETRY=off
export HEADROOM_OUTPUT_SHAPER=1

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

# Added by AIM CLI
export PATH="$HOME/.aim/mcp-servers:$PATH"

# Source cmux's zsh shell integration. cmux sets CMUX_SHELL_INTEGRATION_DIR
# but does NOT auto-source the script — without this block, no cwd reporting,
# tabs/splits open in `~` instead of $PWD, and the cmux CLI wrappers are absent.
# Confirmed 2026-06-19: verified empty hook registrations both with prezto on
# and with prezto disabled, so this is required regardless of plugin manager.
# Locally enable `clobber` because the shim-installer uses `>file` and prezto's
# noclobber default trips it (warns on every new tab).
if [[ -n "$CMUX_SHELL_INTEGRATION_DIR" && -f "$CMUX_SHELL_INTEGRATION_DIR/cmux-zsh-integration.zsh" ]]; then
  () {
    emulate -L zsh
    setopt clobber
    source "$CMUX_SHELL_INTEGRATION_DIR/cmux-zsh-integration.zsh"
    # cmux re-installs the claude shim from a precmd hook (_cmux_fix_path).
    # That hook runs outside this anonymous function's scope, so noclobber is
    # back in effect by then — patch the function body to re-enable clobber.
    if (( $+functions[_cmux_fix_path] )); then
      functions[_cmux_fix_path]='emulate -L zsh
setopt clobber
'"${functions[_cmux_fix_path]}"
    fi
  }
fi

# Emit OSC 7 (cwd) so Ghostty/cmux can inherit cwd into new tabs/splits.
# cmux's own integration tracks cwd internally but does not emit OSC 7,
# which is what `tab-inherit-working-directory` / `split-inherit-working-directory`
# require. Emit it ourselves on every directory change + once at startup.
if [[ "$TERM" == "xterm-ghostty" || -n "$GHOSTTY_RESOURCES_DIR" ]]; then
  _emit_osc7_cwd() {
    local pwd_url
    # URL-encode PWD: percent-encode anything outside RFC 3986 unreserved set.
    pwd_url="${PWD//\%/%25}"
    pwd_url="${pwd_url// /%20}"
    printf '\033]7;file://%s%s\033\\' "${HOST:-$(hostname)}" "$pwd_url"
  }
  autoload -Uz add-zsh-hook
  add-zsh-hook chpwd _emit_osc7_cwd
  _emit_osc7_cwd
fi
