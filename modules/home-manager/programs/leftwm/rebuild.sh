#!/usr/bin/env bash

cd /home/js/.nixos
git add *
git commit
sudo nixos-rebuild switch --flake /home/js/.nixos#agro