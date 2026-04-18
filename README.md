# dotfiles

Minimalist Hyprland setup for Arch (x86) and Asahi Alarm (aarch64).

## First install

```bash
# Arch or Asahi Alarm — same steps
sudo pacman -S --needed git
git clone <this-repo-url> ~/.dotfiles
# Rename the host template to match your actual hostname:
mv ~/.dotfiles/hypr/.config/hypr/hosts/archdesk.conf \
   ~/.dotfiles/hypr/.config/hypr/hosts/"$(hostname)".conf
# (or asahi.conf on the MacBook — edit monitors/AQ_DRM_DEVICES inside)
~/.dotfiles/bootstrap.sh
reboot
```

On first boot, TTY1 autologin drops you straight into Hyprland.

## Syncing changes

After `git pull`:

```bash
~/.dotfiles/apply.sh
```

Re-applies packages (no-op for already installed) and refreshes all symlinks.

## Per-host config

Create `hypr/.config/hypr/hosts/$(hostname).conf` with monitor and input settings for that machine. `apply.sh` picks it up automatically.

## Keybindings

See `hypr/.config/hypr/binds.conf`. Super = Mod.

| Key | Action |
|-----|--------|
| Super+Return | Ghostty |
| Super+D | Launcher (fuzzel) |
| Super+Q | Kill window |
| Super+F | Fullscreen |
| Super+L | Lock |
| Super+Shift+E | Exit Hyprland |
| Super+hjkl | Focus |
| Super+Shift+hjkl | Move window |
| Super+1..5 | Workspace |
| Super+Shift+1..5 | Send to workspace |
| Super+Ctrl+hjkl | Resize |
| Print | Region → clipboard |
| Ctrl+Print | Screen → file + clipboard |
| Shift+Print | Region → file + clipboard + GIMP |

## Troubleshooting

- **Hyprland won't start on MacBook**: check `AQ_DRM_DEVICES` in `hosts/<hostname>.conf`. Run `ls /dev/dri/` and adjust card numbers.
- **Lock screen is black, no prompt**: `hyprlock.conf` missing or unreadable.
- **Top row doesn't act as F-keys on MacBook**: `bootstrap.sh` didn't run, or initramfs wasn't rebuilt.
- **Stow conflict on an existing file**: back it up (`mv ~/.zshrc ~/.zshrc.orig`), re-run `apply.sh`.
