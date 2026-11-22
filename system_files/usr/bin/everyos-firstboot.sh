#!/bin/bash
FLAG="$HOME/.config/everyos-firstboot-done"
if [ -f "$FLAG" ]; then exit 0; fi

flatpak install -y --noninteractive flathub com.usebottles.bottles
flatpak run --command=bottles-cli com.usebottles.bottles new \
  --bottle-name "WindowsApps" --environment application

mkdir -p "$HOME/.config"
touch "$FLAG"
