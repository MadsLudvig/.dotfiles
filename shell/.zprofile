[[ -f ~/.zshrc ]] && . ~/.zshrc

export GTK_THEME=Adwaita:dark
export _JAVA_OPTIONS="-Dsun.java2d.uiScale=1.9 -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export XDG_DATA_DIRS=/usr/local/share:/usr/share:${XDG_DATA_DIRS:-}
export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:$XDG_DATA_DIRS
export XDG_DATA_DIRS=$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"

if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec start-hyprland
fi
