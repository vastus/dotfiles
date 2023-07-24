if [ -f $HOME/.alias.linux ]; then
  source $HOME/.alias.linux
fi

if [ -f $HOME/.alias.macos ]; then
  source $HOME/.alias.macos
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd nomatch notify
unsetopt appendhistory beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/juhoh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zsh
zstyle ':completion:*' special-dirs true

# exports
export PS1='[%c] %# '
export EDITOR=vim

# alias
alias ack='ack --ignore-dir node_modules/ --ignore-dir coverage/ --ignore-dir log/ --ignore-dir build/'
alias e='emacsclient'
alias updatedb='/usr/libexec/locate.updatedb'
alias ls='ls --color=auto'

# rbenv
if which rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

# kubectl completion
if which kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

# direnv
if which direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# pg
export PGDATA="/usr/local/var/postgres"

# iex
export ERL_AFLAGS="-kernel shell_history enabled"

# stack
export PATH="$HOME/.local/bin:$PATH"

# common
export LC_ALL="en_US.UTF-8"

# export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/tt-prod-1:$KUBECONFIG"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# h&m proxy
if which scutil >/dev/null 2>&1 && scutil --proxy | grep proxypac.hm.com > /dev/null; then
  export http_proxy=http://seproxy.hm.com:8080
  export https_proxy=http://seproxy.hm.com:8080
fi

# brew java
export PATH="/opt/homebrew/Cellar/openjdk/19.0.2/bin:$PATH"
export JAVA_HOME="/opt/homebrew/Cellar/openjdk/19.0.2"

trash() {
  mv "$@" ~/trash
}

alias rm='trash'

# prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_ # on the right side
PROMPT='[%c]'\$vcs_info_msg_0_' %# '
# PROMPT='[%c] ('\$vcs_info_msg_0_') %# '
zstyle '(:vcs_info:git:*)' formats ' (%b)'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/juhoh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/juhoh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/juhoh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/juhoh/google-cloud-sdk/completion.zsh.inc'; fi
