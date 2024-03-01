#!/usr/bin/env bash

echo "This script will setup up your configuration.nix, hardware-configuration.nix, home.nix, and user.nix"
read -p "Location of hardware-configuration.nix: " hardware
read -p "Hostname: " hostname
read -p "Username: " username
read -p "Full Name (for git config): " fullname
read -p "Email (for git config): " email

# setup host config
mkdir ./hosts/$hostname
cp $hardware ./hosts/$hostname/hardware-configuration.nix
sed "s:example-hostname:$hostname:g" ./hosts/example/configuration.nix | sed "s:example-uname:$username:g" > ./hosts/$hostname/configuration.nix

# setup user config
mkdir ./users/$username
sed "s:full-name:$fullname:g" ./users/example/example.nix | sed "s:example-uname:$username:g" > ./users/$username/$username.nix
sed "s:example-uname:$username:g" ./users/example/home.nix | sed "s:full-name:$fullname:g" | sed "s:user-email:$email:g" > ./users/$username/home.nix