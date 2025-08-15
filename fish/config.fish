fish_vi_key_bindings

/opt/homebrew/bin/brew shellenv | source

set -U fish_greeting

set -gx DYLD_LIBRARY_PATH /opt/homebrew/lib $DYLD_LIBRARY_PATH
set -gx LIBCLANG_PATH "/opt/homebrew/opt/llvm/lib"
set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH $BUN_INSTALL/bin $PATH
set -gx DYLD_LIBRARY_PATH "/Library/Frameworks/pylon.framework/Versions/A/Libraries/" $DYLD_LIBRARY_PATH
set -gx PATH "$HOME/.local/share/nvim/mason/bin" $PATH
set -gx LLVM_SYS_180_PREFIX "/opt/homebrew/opt/llvm@18"
set -gx LIBRARY_PATH "/opt/homebrew/lib" $LIBRARY_PATH
set -gx LDFLAGS "-L/opt/homebrew/lib"
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.local/share/bob/nvim-bin $PATH
set -gx XDG_CONFIG_HOME "$HOME/.config"

# BUN
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


function cat
    bat $argv
end

function l
    eza $argv
end

# Start or attach to a Zellij session automatically
if status is-interactive
    if not set -q ZELLIJ_SESSION_NAME
        zellij attach || zellij
    end
end


bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward
bind -M insert \cy accept-autosuggestion

zoxide init fish | source


