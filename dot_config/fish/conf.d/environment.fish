switch (uname)
    case Darwin
        set -gx KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac"
end

# Add Composer bin folder.
fish_add_path ~/.composer/vendor/bin

# Add .local/bin for pipx.
fish_add_path ~/.local/bin

# Private home folder bin.
fish_add_path ~/bin

# Disable ads from npm packages.
set -x DISABLE_OPENCOLLECTIVE 1

# Enable CLI history for iex (Elixir).
set -x ERL_AFLAGS "-kernel shell_history enabled"

# NeoVim as man-pager
set -x MANPAGER "nvim +Man!"

# Let everyone know that this is a colour terminal.
set -x TERM xterm-256color

# Set XDG folders explicitly, since some apps don’t use them as defaults.
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share

# Whoever designed Go decided it was a great idea for it to vomit up its
# files in middle of the user’s home-dir and needs to be explicitly
# configured otherwise. Thanks, geniuses.
set -x GOPATH $XDG_DATA_HOME/go
