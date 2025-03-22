#!/usr/bin/bash

USERNAME=alex

mkdir "/etc/skel/workspace"
echo -e "\n# my changes\nexport EDITOR=nvim\ncd ~/workspace" >> /etc/skel/.bashrc

groupadd docker
useradd -m -G wheel "$USERNAME"
usermod -aG docker "$USERNAME"
passwd "$USERNAME"

pacman-key --init
pacman-key --populate archlinux

pacman -Syu --noconfirm

pacman -S --needed --noconfirm man-db man-pages neovim which tree git github-cli base-devel unzip

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

echo -e "\n[user]\ndefault=$USERNAME" >> /etc/wsl.conf
