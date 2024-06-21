# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH

#Add color aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias vi='vim -u NONE'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias ip="ip -c"
alias diff="colordiff"
alias ls="exa --icons=always --color=always -s type"
alias cat="bat"


alias vim="nvim"

if [ -n "$PS1" ]
then
    #Enable full color terminal on interactive session
    export TERM=xterm-256color
    #Change prompt
    export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\h\[$(tput sgr0)\][\[$(tput sgr0)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]]>\[$(tput sgr0)\]"
fi
