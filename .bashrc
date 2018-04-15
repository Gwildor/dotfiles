export PS1="[\[$(tput sgr0)\]\[\033[38;5;14m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\] \[\033[32m\]\u\[\033[38;5;9m\]@\[\033[33;1m\]\W\[\033[m\]\$(parse_git_branch_or_tag)\[\033[38;5;3m\]\\$\[$(tput sgr0)\] "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

export LC_ALL='en_US.UTF-8'
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

export VISUAL=vim
export EDITOR="$VISUAL"

[[ $- = *i* ]] && bind TAB:menu-complete

[ -f ~/.bash/git-prompt ] && source ~/.bash/git-prompt
[ -f ~/.bash/git-completion.bash ] && source ~/.bash/git-completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export FZF_DEFAULT_COMMAND='fd --type file --hidden --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--ansi'
