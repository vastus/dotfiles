# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch notify
unsetopt appendhistory beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/juhoh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# prompt
export PS1='[%c] %# '

# alias
alias ls='ls --classify --color=auto'
