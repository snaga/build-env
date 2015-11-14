# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
PS1="{\!}\u@\h:\w$ "
export PS1

PATH=$PATH:$HOME/bin
export PATH
