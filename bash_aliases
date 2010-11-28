alias ll='ls -l'
alias la='ls -lAh'
alias l='ls -CF'
alias tabe='mvim'
alias drush='php ~/bin/drush.php'
mgrep () { grep -Ir --colour=always "$@" * ; }
tsh () { ssh -t $1 "tmux attach || tmux new || login" $2 $3 * ; }

