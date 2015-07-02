# status
PS1="[\W] \$ "

# env
export PGDATA=/usr/local/var/postgres
export HOMEBREW_GITHUB_API_TOKEN=72cc8c5c1564a7ab5a59bd9529404ccf9ae7878b
export CODEPATH=$HOME/Code
export GOPATH=$CODEPATH/go

# path
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$PATH:$GOPATH/bin

# alias
alias ls="ls -FG"
alias ack="ack --ignore-dir .git"

# completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# rbenv
eval "$(rbenv init -)"

# direnv
eval "$(direnv hook bash)"

