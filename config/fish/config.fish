# Main Fish config file.

# No greeting, thx.
set fish_greeting "🐟"

# See also the conf.d folder next to this file.
function fish_user_key_bindings
    fish_vi_key_bindings
end

source {$HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.fish

starship init fish | source
zoxide init --cmd j fish | source
