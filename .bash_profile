source ~/.bashrc
source ~/.git-prompt.sh
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;35m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
PATH="$HOME/bin:$PATH"