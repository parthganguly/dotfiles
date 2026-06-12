# Parth's dotfiles

Hyprland-centered Linux desktop configuration for Wayland, Waybar, Eww, Rofi,
Alacritty, Ghostty, Neovim, tmux, GTK, mpv, and local utility scripts.

## Layout

| Path | Target |
| --- | --- |
| `hypr/` | `~/.config/hypr/` |
| `waybar/` | `~/.config/waybar/` |
| `eww/` | `~/.config/eww/` |
| `rofi/` | `~/.config/rofi/` |
| `alacritty/` | `~/.config/alacritty/` |
| `ghostty/` | `~/.config/ghostty/` |
| `nvim/` | `~/.config/nvim/` |
| `zed/` | `~/.config/zed/` |
| `gtk-3.0/` | `~/.config/gtk-3.0/` |
| `gtk-4.0/` | `~/.config/gtk-4.0/` |
| `mpv/` | `~/.config/mpv/` |
| `local-bin/` | `~/.local/bin/` |
| `scripts/` | `~/Scripts/` |
| `shell/bashrc` | `~/.bashrc` |
| `shell/bash_profile` | `~/.bash_profile` |
| `shell/profile` | `~/.profile` |
| `git/gitconfig` | `~/.gitconfig` |
| `tmux/tmux.conf` | `~/.tmux.conf` |

## Install

Run from the repo root:

```bash
./install.sh
```

The installer backs up existing files before creating symlinks.

## Packages

`packages/arch.txt` lists the packages these configs expect on an Arch-based
system. Install it with:

```bash
sudo pacman -S --needed - < packages/arch.txt
```

Some entries may come from the AUR depending on the machine.

## Notes

- `scripts/mount-gdrive.sh` expects an rclone remote named `gdrive`.
- `hypr/hyprland.conf` references `~/Pictures/Wallpapers/witcher-mac.png`.
- Secrets and session files are intentionally excluded.
