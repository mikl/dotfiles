if status is-interactive
    # Standard shell stuff.
    abbr --add ls 'eza'
    abbr --add ll 'eza -l'
    abbr --add la 'eza -lAh'
    abbr --add l 'eza -CF'

    # Use bat instead of cat
    abbr --add cat 'bat'

    # NeoVim
    abbr --add ni nvim
    abbr --add vi nvim
    abbr --add vim nvim
    abbr --add tabe nvim

    # Various tools
    abbr --add lg lazygit
    abbr --add yay paru
end
