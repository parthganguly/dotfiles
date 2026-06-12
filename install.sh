#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
backup_root="${HOME}/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link_path() {
  local source_path="$1"
  local target_path="$2"

  mkdir -p "$(dirname "${target_path}")"

  if [[ -L "${target_path}" && "$(readlink "${target_path}")" == "${source_path}" ]]; then
    printf 'ok: %s\n' "${target_path}"
    return
  fi

  if [[ -e "${target_path}" || -L "${target_path}" ]]; then
    local backup_path="${backup_root}${target_path#${HOME}}"
    mkdir -p "$(dirname "${backup_path}")"
    mv "${target_path}" "${backup_path}"
    printf 'backup: %s -> %s\n' "${target_path}" "${backup_path}"
  fi

  ln -s "${source_path}" "${target_path}"
  printf 'link: %s -> %s\n' "${target_path}" "${source_path}"
}

link_path "${repo_dir}/hypr" "${HOME}/.config/hypr"
link_path "${repo_dir}/waybar" "${HOME}/.config/waybar"
link_path "${repo_dir}/eww" "${HOME}/.config/eww"
link_path "${repo_dir}/rofi" "${HOME}/.config/rofi"
link_path "${repo_dir}/alacritty" "${HOME}/.config/alacritty"
link_path "${repo_dir}/ghostty" "${HOME}/.config/ghostty"
link_path "${repo_dir}/nvim" "${HOME}/.config/nvim"
link_path "${repo_dir}/zed" "${HOME}/.config/zed"
link_path "${repo_dir}/gtk-3.0" "${HOME}/.config/gtk-3.0"
link_path "${repo_dir}/gtk-4.0" "${HOME}/.config/gtk-4.0"
link_path "${repo_dir}/mpv" "${HOME}/.config/mpv"
link_path "${repo_dir}/local-bin" "${HOME}/.local/bin"
link_path "${repo_dir}/scripts" "${HOME}/Scripts"
link_path "${repo_dir}/shell/bashrc" "${HOME}/.bashrc"
link_path "${repo_dir}/shell/bash_profile" "${HOME}/.bash_profile"
link_path "${repo_dir}/shell/profile" "${HOME}/.profile"
link_path "${repo_dir}/git/gitconfig" "${HOME}/.gitconfig"
link_path "${repo_dir}/tmux/tmux.conf" "${HOME}/.tmux.conf"

printf 'done\n'
