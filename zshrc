# mikls zsh config file.

# Environment variables.
export CLICOLOR=1
export COLORTERM=yes
export EDITOR=vim
export LESS=-r
export LSCOLORS=CxFxExDxBxegedabagacad
export PAGER=less

# Load Antigen if installed.
if [ -f ~/.antigen/antigen.zsh ] ; then
  source ~/.antigen/antigen.zsh
fi

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

# Use the same aliases as bash.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Use npm bindir if available.
#
if [ -d /usr/local/share/npm/bin ] ; then
    PATH="${PATH}":/usr/local/share/npm/bin
fi

# Allow Rubygems to be installed in my homedir.
export GEM_HOME=$HOME/gems
export PATH=$GEM_HOME/bin:$PATH

# Load tmuxinator if available.
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Command history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt appendhistory hist_ignore_all_dups hist_ignore_space

# Keybindings
bindkey -v # VI-style keybindings
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# Misc. settings
unsetopt beep # Disable console beeps.
setopt autocd notify

# Configure the prompt
autoload -U promptinit && promptinit
setopt prompt_subst

export PROMPT="%F{cyan}(%f%n@%U%m%u%F{cyan})%f %F{cyan}(%f%i/%l/%?%F{cyan})%f %F{cyan}(%f%~%F{cyan})%f
%# "

# If available, use liquidprompt.
if [ -f /usr/local/bin/liquidprompt ]; then
  .  /usr/local/bin/liquidprompt
fi
