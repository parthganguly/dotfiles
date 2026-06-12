#!/bin/bash
mkdir -p "$HOME/GoogleDrive"
rclone mount gdrive: "$HOME/GoogleDrive" \
  --vfs-cache-mode full \
  --dir-cache-time 72h \
  --poll-interval 15s \
  --daemon
