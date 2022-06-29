# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

alias python=python.exe

alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias grep='grep --color'
alias l.='ls -d .* --color'
alias ll='ls -l --color'
alias ls='ls --color'
alias vi='vim'
alias xzegrep='xzegrep --color'
alias xzfgrep='xzfgrep --color'
alias xzgrep='xzgrep --color'
alias zegrep='zegrep --color'
alias zfgrep='zfgrep --color'
alias zgrep='zgrep --color'

export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\h\[$(tput sgr0)\][\[$(tput sgr0)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]]>\[$(tput sgr0)\]"
