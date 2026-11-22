#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages
dnf5 install -y \
    tmux \
    python3-tkinter \
    jq \
    usbutils \
    procps-ng \
    pciutils

git clone --depth=1 https://github.com/quickemu-project/quickemu.git /tmp/quickemu
install -Dm755 /tmp/quickemu/quickemu /usr/bin/quickemu
install -Dm755 /tmp/quickemu/quickget /usr/bin/quickget
install -Dm755 /tmp/quickemu/chunkcheck /usr/bin/chunkcheck
rm -rf /tmp/quickemu

systemctl enable podman.socket
