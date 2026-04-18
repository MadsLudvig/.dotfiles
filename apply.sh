#!/usr/bin/env bash
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOST="$(hostname)"

IS_ASAHI=0
if [[ "$(uname -m)" == "aarch64" ]] && grep -qE '^\[asahi' /etc/pacman.conf; then
  IS_ASAHI=1
fi

# 1. Baseline packages
sudo pacman -Syu --needed --noconfirm - < "$REPO/packages/arch.txt"

# 2. Asahi extras
if [[ $IS_ASAHI -eq 1 ]]; then
  sudo pacman -S --needed --noconfirm - < "$REPO/packages/arch-asahi.txt"
fi

# 3. yay if missing, then AUR packages
if ! command -v yay >/dev/null; then
  tmp=$(mktemp -d)
  git clone https://aur.archlinux.org/yay-bin.git "$tmp"
  (cd "$tmp" && makepkg -si --noconfirm)
  rm -rf "$tmp"
fi
yay -S --needed --noconfirm grimblast-git

# 4. Stow every top-level dir except bookkeeping
cd "$REPO"
SKIP=(packages .git)
for pkg in */; do
  pkg="${pkg%/}"
  [[ " ${SKIP[*]} " == *" $pkg "* ]] && continue
  stow --target="$HOME" --restow "$pkg"
done

# 5. Per-host Hyprland symlink
HOST_CONF="$HOME/.config/hypr/hosts/${HOST}.conf"
if [[ -f "$HOST_CONF" ]]; then
  ln -sfn "$HOST_CONF" "$HOME/.config/hypr/host.conf"
else
  echo "Warning: no host config found for $HOST at $HOST_CONF" >&2
fi

# 6. Screenshots dir + audio user services
mkdir -p "$HOME/Pictures/Screenshots"
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# 7. Default shell to zsh (idempotent)
if [[ "$(getent passwd "$USER" | cut -d: -f7)" != *zsh ]]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi

echo "Done."
