# OS-specific overrides.
case `uname -s` in
    'Darwin') # Mac OS X
        # Make sure /usr/local/bin takes precendence over /usr/bin
        PATH=/usr/local/sbin:/usr/local/bin:"${PATH}"

        # Add our Homebrew Python bin.
        PATH=/usr/local/share/python:"${PATH}"

        # Use vimpager.
        export PAGER=vimpager

        # Set path to NodeJS packages.
        export NODE_PATH=/usr/local/lib/node

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

# Allow Rubygems to be installed in my homedir.
export GEM_HOME=$HOME/gems
export PATH=$GEM_HOME/bin:$PATH
