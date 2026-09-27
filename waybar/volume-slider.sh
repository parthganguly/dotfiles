#!/usr/bin/env bash

set -u

command -v wpctl >/dev/null || exit 1
command -v zenity >/dev/null || exit 1

current=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f", $2 * 100}')

zenity --scale \
  --title='Volume' \
  --text='0–100% normal · 101–150% amplified' \
  --min-value=0 \
  --max-value=150 \
  --value="${current:-100}" \
  --step=1 \
  --print-partial 2>/dev/null |
while IFS= read -r level; do
  wpctl set-volume @DEFAULT_AUDIO_SINK@ "${level}%"
done
