# mikls zsh config file.

# Environment variables.
export CLICOLOR=1
export COLORTERM=yes
export EDITOR=vim
export LESS=-r
export LSCOLORS=CxFxExDxBxegedabagacad
export PAGER=less

# Use the same aliases as bash.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

if [ -d ~/.nvm ]; then
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

# If available, use liquidprompt.
if [ -f /usr/local/share/liquidprompt ]; then
  .  /usr/local/share/liquidprompt
fi
