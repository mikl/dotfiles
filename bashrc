# Mikkel Hoegh's bashrc. Inspired from lots of different sources.

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
# Case-insensitive tab-completion
set completion-ignore-case On
# Configure bash to use vi-style editing of the command line.
set -o vi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Default pager and editor setting.
export PAGER=less
export LESS=-r
export EDITOR=/usr/bin/vim

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Loading bash aliases from ~/.bash_aliases, instead of adding them here.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# OS-specific overrides.
case `uname -s` in
    'Darwin') # Mac OS X
        # Make sure /usr/local/bin takes precendence over /usr/bin
        PATH=/usr/local/bin:"${PATH}"

        # Add our Homebrew Python bin.
        PATH=/usr/local/Cellar/python/2.7/bin:"${PATH}"

        # Set path to NodeJS packages.
        export NODE_PATH=/usr/local/lib/node

        if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
            export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
        fi
    ;;
    'FreeBSD')
        if [ -f /usr/local/bin/vim ]; then
            # Use VIM from ports if available.
            export EDITOR=/usr/local/bin/vim
            # Set FreeBSD package mirror.
            export PACKAGEROOT=http://ftp.dk.freebsd.org
        fi
    ;;
esac

# Highly customised bash promt grabbed from somewhere I don't remember.
function setprompt {
    # Teal colour, works on both dark and light backgrounds.
    local sc="\[\033[0;36m\]"
    # Remove colour
    local nc="\[\033[0m\]"


    case $TERM in
        xterm*|rxvt*)
            local title='\[\033]0;\u@\h:\w\007\]'
            ;;
        *)
            local title=""
            ;;
    esac

    # Start with the user@host part.
    PS1="$title$sc($nc\u$sc@$nc\h$sc)"
    # Add command-number/job count/shell device
    PS1="$PS1 $sc($nc\#/\j/\l$sc)"
    # Add current dir and newline
    PS1="$PS1 $sc($nc\w$sc)"

    # If available, add vcprompt to PS1.
    if [ -f ~/bin/vcprompt ]; then
        PS1=$PS1' $(vcprompt -f \(%n:%b%r%m%u\))'
    fi

    # And finally, the prompt symbol preceeded by a newline.
    export PS1="$PS1\n$nc\$ "
}

setprompt

