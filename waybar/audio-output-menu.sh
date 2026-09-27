#!/usr/bin/env bash

set -u

command -v pactl >/dev/null || exit 1
command -v rofi >/dev/null || exit 1

choice=$(
  {
    printf '%s\n' 'Headphones (3.5 mm)' 'Built-in speakers'
    pactl list short sinks | awk '{print "Output: " $2}'
  } | rofi -dmenu -i -p 'Audio output'
) || exit 0

case "$choice" in
  'Headphones (3.5 mm)')
    pactl set-sink-port @DEFAULT_SINK@ analog-output-headphones
    ;;
  'Built-in speakers')
    pactl set-sink-port @DEFAULT_SINK@ analog-output-speaker
    ;;
  'Output: '*)
    pactl set-default-sink "${choice#Output: }"
    ;;
esac
