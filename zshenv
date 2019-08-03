export CLICOLOR=1
export COLORTERM=yes
export EDITOR=nvim
export LESS=-r
export LSCOLORS=CxFxExDxBxegedabagacad
export PAGER=less

# Disable auto-title for tmuxp compatibility.
export DISABLE_AUTO_TITLE=true

# Enable CLI history for iex (Elixir).
export ERL_AFLAGS="-kernel shell_history enabled"

# OS-specific overrides.
case `uname -s` in
    'Darwin') # Mac OS X
        # Make sure /usr/local/bin takes precendence over /usr/bin
        PATH=/usr/local/sbin:/usr/local/bin:"${PATH}"

        # Add Composer bin folder.
        PATH="${HOME}/.composer/vendor/bin:${PATH}"

        # Add Ruby bin folder (macOS 10.14).
        PATH="${HOME}/.gem/ruby/2.3.0/bin:${PATH}"

        # Use vimpager.
        export PAGER=vimpager

        # Set path to NodeJS packages.
        export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

        if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
            export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
        fi
    ;;
    'FreeBSD')
        if [ -f /usr/local/bin/vim ]; then
            # Set FreeBSD package mirror.
            export PACKAGEROOT=http://ftp.dk.freebsd.org
        fi
    ;;
esac

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Use npm bindir if available.
if [ -d /usr/local/share/npm/bin ] ; then
    PATH="${PATH}":/usr/local/share/npm/bin
fi

# Safe settings for locale stuff.
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FZF configuration
export FZF_DEFAULT_COMMAND='pt -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
