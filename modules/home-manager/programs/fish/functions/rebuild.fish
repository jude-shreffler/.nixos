#!/usr/bin/env fish

cd /home/js/.nixos
sudo nixos-rebuild switch --flake /home/js/.nixos\#$hostname
git add *
git commit
