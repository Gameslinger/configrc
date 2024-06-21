
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gabe2max/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
#
export PS1='%F{green}%n%f:%F{blue}%m%f[%F{red}%~%f]>'
zstyle ':completion:*' menu select search
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
alias cat="bat"
alias ls="exa --icons=always --color=always -s type"
alias vim="nvim"

eval "$(zoxide init --cmd cd zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
