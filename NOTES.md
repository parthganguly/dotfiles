# Machine Notes

## Desktop

- Session: Hyprland on Wayland.
- Primary launcher: Rofi.
- Bar: Waybar.
- Widgets: Eww, with the `witcher` widget opened on session start.
- Lock/idle: Hyprlock and Hypridle.
- Wallpaper helper: `~/.local/bin/set-wallpaper`.

## Local Assumptions

- `~/Applications/helium.AppImage` exists for the `SUPER+B` binding.
- `~/Pictures/Wallpapers/witcher-mac.png` exists for the current wallpaper.
- An rclone remote named `gdrive` exists for `scripts/mount-gdrive.sh`.

## Auth

GitHub CLI auth is not tracked. Run this after restoring on a new machine:

```bash
gh auth login
gh auth status
```
