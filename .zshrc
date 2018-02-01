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
alias ls='ls -FG'
alias ack='ack --ignore-dir node_modules/ --ignore-dir coverage/ --ignore-dir log/ --ignore-dir build/'
alias e='emacsclient'
alias updatedb='/usr/libexec/locate.updatedb'

# rbenv
eval "$(rbenv init -)"

# direnv
eval "$(direnv hook zsh)"


# prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_ # on the right side
PROMPT='[%c]'\$vcs_info_msg_0_' %# '
# PROMPT='[%c] ('\$vcs_info_msg_0_') %# '
zstyle '(:vcs_info:git:*)' formats ' (%b)'
