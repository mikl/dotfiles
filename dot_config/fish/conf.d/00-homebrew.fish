# search in common homebrew paths (macOS (ARM), Linux (global/default), Linux (alternate), macOS (Intel))
set -l common_brew_paths /opt/homebrew /home/linuxbrew/.linuxbrew ~/.linuxbrew /usr/local
for brewpath in $common_brew_paths
    if test -x "$brewpath/bin/brew"
        eval ("$brewpath/bin/brew" shellenv)
        break
    end
end
