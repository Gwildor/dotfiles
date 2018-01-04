export PS1="[\[$(tput sgr0)\]\[\033[38;5;14m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\] \[\033[32m\]\u\[\033[38;5;9m\]@\[\033[33;1m\]\W\[\033[m\]\$(parse_git_branch_or_tag)\[\033[38;5;3m\]\\$\[$(tput sgr0)\] "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

export LC_ALL='en_US.UTF-8'
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

[[ $- = *i* ]] && bind TAB:menu-complete

[ -f ~/.bash/git-prompt ] && source ~/.bash/git-prompt
[ -f source ~/.bash/git-completion.bash ] && source ~/.bash/git-completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
