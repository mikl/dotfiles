# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Keep 10000 lines in .bash_history (default is 500)
export HISTSIZE=10000
# Append instead of overwriting when recording history.
shopt -s histappend
# Don't store useless commands in the history.
export HISTIGNORE="fg"
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# Erase duplicates when writing the history files (I think).
export HISTCONTROL=erasedups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

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

# Highly customised bash promt grabbed from somewhere I don't remember.
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

PS1="$TITLEBAR\
$COLOUR1-$COLOUR2($NO_COLOUR\u$COLOUR3@$NO_COLOUR\h$COLOUR2)\
$COLOUR1-$COLOUR2($NO_COLOUR\#$COLOUR3/$NO_COLOUR$GRAD1$COLOUR2)\
$COLOUR1-$COLOUR2($NO_COLOUR\w$COLOUR2)$COLOUR1-\n\
$COLOUR1-$COLOUR2($NO_COLOUR\$ " 
}

export PATH=/opt/local/apache2/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/opt/local/lib/postgresql83/bin/:$PATH
export PAGER=less
export LESS=-r
export EDITOR=/usr/bin/vim
export CVSROOT=:pserver:mikl@cvs.drupal.org:/cvs/drupal-contrib

setprompt

