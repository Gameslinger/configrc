# .bashrc
#Install vundle if it doesn't exist
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

#Add color aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
#alias vi='vim'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias ip="ip -c"

if [ -n "$PS1" ]
then
    #Enable full color terminal on interactive session
    export TERM=xterm-256color
    #Change prompt
    export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\h\[$(tput sgr0)\][\[$(tput sgr0)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]]>\[$(tput sgr0)\]"
fi
