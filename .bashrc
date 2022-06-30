# .bashrc
#Install vundle if it doesn't exist
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi=vim
export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\h\[$(tput sgr0)\][\[$(tput sgr0)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]]>\[$(tput sgr0)\]"
