export JAVA_OPTS="${JAVA_OPTS} -Xms128m -Xmx512m"

# ------------------------------------------
# Aliases
# ------------------------------------------
alias clojurepl="java -cp /usr/local/Cellar/clojure/1.5.1/clojure-1.5.1.jar clojure.main"
alias gits="git status"
alias mac_emacs="open ~/Applications/Emacs.app"

# Ruby related
export ARCHFLAGS="-arch x86_64"

export EDITOR=vim
alias vi="vim"

# View markdown from terminal
mdview() { /usr/local/bin/markdown "$@" | lynx -stdin; }
md2html() { pandoc -s -f markdown_github -t html "$@"  | lynx -stdin; }

# CLI colours
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

export HISTCONTROL=ignoreboth  # Ignore dups and commands that start with a space - they won't get added to history
export HISTFILESIZE=5000       # Keep up to 5000 lines in history (default is 500)
export HISTSIZE=5000           # Keep up to 5000 commands in shell history (default is 500)
shopt -s histappend            # append to the history file, don't overwrite it
shopt -s cmdhist               # In history file, combine multi-line comamnds into one line
#stty stop ""                  # Disable the default meaning of C-s so it can be used for incremental search forward
bind space:magic-space         # Space dynamically expands any ! history expansions
set -o emacs

#-------------------------------------------
# Python Virtual Environments
#-------------------------------------------
# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
# autoenv
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/opt/autoenv/activate.sh
fi

# ------------------------------------------
# PATH setup
# ------------------------------------------

# Ruby (add --user-install gems to this path)
# e.g. `gem install bropages --user-install`
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# User bin files
export PATH="$PATH:~/bin"

# Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# -----------
# Groovy
# -----------
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# -----------
# Go Lang
# -----------
export GOPATH=$HOME/dev/golang
export GOROOT=`go env GOROOT`
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
alias gotags="gotags -tag-relative=true -R=true -sort=true -f='tags' -fields=+l ."

# -----------
# Haskell
# -----------
# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/opt/homebrew-cask/Caskroom/ghc/7.10.1-r0/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

#--------
# VS Code
#--------

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

#----
# NVM
#----

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# JBoss
export EAP_HOME=/Users/clarence/dev/tools/EAP-6.4.0

# direnv setup
eval "$(direnv hook bash)"

# pkg-config
export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/opt/X11/lib/pkgconfig"

# Homebrew
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

#-------------------------------------
# Source private stuff (not checked-in)
#--------------------------------------
if [ -f ~/.bash_private ]; then
  source ~/.bash_private
fi
