[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source ~/.bashrc
source ~/.git-prompt.sh
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;35m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=./node_modules/.bin:/Users/user/.local/bin:$HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export PATH=/Users/user/Library/Python/3.7/bin:$PATH

export PATH=/usr/local/opt/mysql-client/bin:$PATH

export LANG=
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if [ -e /Users/user/.ghcup/env ]; then
	source /Users/user/.ghcup/env
fi
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
