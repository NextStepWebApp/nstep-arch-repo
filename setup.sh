#!/bin/bash

sudo sh -c "cat >> /etc/pacman.conf <<'EOF'

[nstep-arch-repo]
SigLevel = Optional TrustAll
Server = https://github.com/NextStepWebApp/nstep-arch-repo/raw/refs/heads/main/\$arch
EOF"

sudo pacman -Syyu --noconfirm

sudo pacman -S nstep-git --noconfirm
