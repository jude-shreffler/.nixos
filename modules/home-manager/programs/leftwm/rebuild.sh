#!/usr/bin/env bash

cd /home/js/.nixos
git add *
sudo nixos-rebuild switch --flake /home/js/.nixos#agro