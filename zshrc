# mikls zsh config file.

# From here until "User configuration" is oh-my-zsh config.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load oh-my-zsh if installed.
if [ -d ~/.oh-my-zsh ] && [ -f ~/.oh-my-zshrc ]; then
  source ~/.oh-my-zshrc
else
  # If not using oh-my-zsh, fall back on custom configuration.

  # VI-style keybindings
  bindkey -v
  bindkey -M viins '^r' history-incremental-search-backward
  bindkey -M vicmd '^r' history-incremental-search-backward

  # Misc. settings
  unsetopt beep # Disable console beeps.
  setopt autocd notify

  # Liquidprompt is not available, configure a basic prompt.
  if [ ! -f /usr/local/share/liquidprompt ]; then
    # Configure the prompt
    autoload -U promptinit && promptinit
    setopt prompt_subst

    export PROMPT="%F{cyan}(%f%n@%U%m%u%F{cyan})%f %F{cyan}(%f%i/%l/%?%F{cyan})%f %F{cyan}(%f%~%F{cyan})%f %# "
  fi
fi

# Use the same aliases as bash.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load tmuxinator if available.
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Support for iterm2 3.0 shell integration.
# see http://iterm2.com/shell_integration.html
if [ -f ~/.iterm2_shell_integration.zsh ]; then
  source ~/.iterm2_shell_integration.zsh
fi

# Command history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt appendhistory hist_ignore_all_dups hist_ignore_space

# Homebrew-specific settings.
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  FPATH=$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit

  # If available, use liquidprompt.
  if [ -f $HOMEBREW_PREFIX/share/liquidprompt ]; then
    .  $HOMEBREW_PREFIX/share/liquidprompt
  fi

  [ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh

  ASDF_PREFIX=$(brew --prefix asdf)
  if [ -f ${ASDF_PREFIX}/asdf.sh ]; then
    export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
    .  ${ASDF_PREFIX}/asdf.sh
  fi
fi

if [ -d "$HOME/.volta" ]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
