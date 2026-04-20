#!/usr/bin/env bash
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

IS_ASAHI=0
if [[ "$(uname -m)" == "aarch64" ]] && grep -qE '^\[asahi' /etc/pacman.conf; then
  IS_ASAHI=1
fi

# 0. Prereqs for bootstrap + apply.sh (git, stow, build toolchain for AUR)
sudo pacman -Syu --needed --noconfirm git stow base-devel

# 1. MacBook: make top row send F1-F12 by default; Fn for brightness/media
if [[ $IS_ASAHI -eq 1 ]]; then
  echo "options hid_apple fnmode=1" | sudo tee /etc/modprobe.d/hid_apple.conf >/dev/null
  sudo mkinitcpio -P
fi

# 2. TTY1 autologin -> Hyprland via ~/.zprofile
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\\\u' --noclear --autologin $USER %I \$TERM
EOF
sudo systemctl daemon-reload

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. Kill the PC speaker beep, forever
echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf >/dev/null

# 4. Hand off to apply.sh for the user-level setup
exec "$REPO/apply.sh"
