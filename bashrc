# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# Change the window title of X terminals 
case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

# Keep 1000 lines in .bash_history (default is 500)
export HISTSIZE=1000
export HISTFILESIZE=1000

export HISTIGNORE="fg"
export HISTCONTROL=ignoredups


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Macports bash completion :)
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

set completion-ignore-case On

# bash-prompt hacks
 
function setprompt {
    local COLOUR1="\[\033[1;30m\]"
    local COLOUR2="\[\033[0;36m\]"
    local COLOUR3="\[\033[0;36m\]"
    local COLOUR4="\[\033[0;37m\]"
    local NO_COLOUR="\[\033[0m\]"

    case $TERM in
        xterm*|rxvt*)
            local TITLEBAR='\[\033]0;\u@\h:\w\007\]'
            ;;
        *)
            local TITLEBAR=""
            ;;
    esac

    local temp=$(tty)
    local GRAD1=${temp:5}
PS1="$TITLEBAR\
$COLOUR1-$COLOUR2($NO_COLOUR\u$COLOUR3@$NO_COLOUR\h$COLOUR2)\
$COLOUR1-$COLOUR2($NO_COLOUR\#$COLOUR3/$NO_COLOUR$GRAD1$COLOUR2)\
$COLOUR1-$COLOUR2($NO_COLOUR\w$COLOUR2)$COLOUR1-\n\
$COLOUR1-$COLOUR2($NO_COLOUR\$ " 
}



export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/opt/local/lib/postgresql83/bin/:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export PAGER=less
export LESS=-r
export EDITOR=/usr/bin/vim
export CVSROOT=:pserver:mikl@cvs.drupal.org:/cvs/drupal-contrib

setprompt
