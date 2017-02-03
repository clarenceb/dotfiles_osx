export PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [ -f "$HOME/.bashrc" ]; then
    source $HOME/.bashrc
fi

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Git PS1
source ~/.bash_git

# RBENV Shims and Autocompletion
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# The next line updates PATH for the Google Cloud SDK.
#source $HOME/dev/tools/google-cloud-sdk/path.bash.inc

# The next line enables shell command completion for gcloud.
#source $HOME/dev/tools/google-cloud-sdk/completion.bash.inc

