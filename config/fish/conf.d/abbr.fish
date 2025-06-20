if status is-interactive
    # Standard shell stuff.
    abbr --add ll 'ls -l'
    abbr --add la 'ls -lAh'
    abbr --add l 'ls -CF'

    # NeoVim
    abbr --add ni nvim
    abbr --add vi nvim
    abbr --add vim nvim
    abbr --add tabe nvim

    # Various tools
    abbr --add lg lazygit
    abbr --add yay paru
end
