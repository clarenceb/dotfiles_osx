alias vi="vim"

# Ruby related
export ARCHFLAGS="-arch x86_64"

export JAVA_OPTS="${JAVA_OPTS} -Xms128m -Xmx512m"
export EDITOR=vim

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

# Chruby: activate
# - By default chruby will search for Rubies installed into /opt/rubies/ or ~/.rubies/
source /usr/local/opt/chruby/share/chruby/chruby.sh

# Chruby: enable auto-switching of Rubies specified by .ruby-version files
source /usr/local/opt/chruby/share/chruby/auto.sh

# Chruby: specify default ruby
chruby system

# User bin files
export PATH="$PATH:${HOME}/bin"

# Go Lang
export GOPATH=$HOME/dev/golang
export GOROOT=`go env GOROOT`
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
alias gotags="gotags -tag-relative=true -R=true -sort=true -f='tags' -fields=+l ."

# NVM
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

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

#-------------------------------------
# iTerm2 badge support
#-------------------------------------

# See: https://www.iterm2.com/documentation-badges.html

function badge() {
    local text
    text=$1
    printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "${text}" | base64)
}

#------------------------------------
# PHP
#------------------------------------
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

# Hackathon
export VLC_PATH=/Applications/VLC.app/Contents/MacOS/lib
export VLC_PLUGIN_PATH=/Applications/VLC.app/Contents/MacOS/plugins

#----------
# Exercism
#----------
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi
