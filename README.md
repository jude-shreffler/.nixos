# Setup

You'll need a previously generated hardware-configuration to get this to work. Clone this repo to a convenient directory (I recommend ~/.nixos) and run the setup script

```
git clone https://github.com/jude-shreffler/.nixos.git
cd .nixos
chmod +x ./setup.sh
./setup.sh
```

The setup will ask for the location of a hardware-location.nix to copy from, as well as your username, hostname, full name + email (for git config). At the end of the setup you'll have a fully functional user with GDM, LeftWM, Kitty, Fish, Git, Nvim, and VSCode.

To build and switch to this config, run:

```
sudo nixos-rebuild switch --flake flake_parent_dir#hostname
```

For example, my flake is stored at ~/.nixos and my hostname is agro, therefore i use `~/.nixos#agro`

# Keybinds

| Keybinding           | Description                                                            |
| -------------------- | ---------------------------------------------------------------------- |
| Mod + r              | Rebuild nixos config (if it's in ~/.nixos                              |
| Mod + n              | Open nixos config in VSCode (same constraint)                          |
| Mod + p              | Use rofi to start application                                         |
| Mod + Shift + Enter  | Open a terminal                                                        |
| Mod + Shift + Q      | Close the current window                                               |
| Mod + (1-9)          | Switch to a desktop/tag                                                |
| Mod + Shift + (1-9)  | Move the focused window to desktop/tag                                 |
| Mod + W              | Switch the desktops for each screen. Desktops [1][2] changes to [2][1] |
| Mod + Shift + W      | Move window to the other desktop                                       |
| Mod + (⬆️⬇️)         | Focus on the different windows in the current workspace                |
| Mod + Shift + (⬆️⬇️) | Move the different windows in the current workspace                    |
| Mod + Enter          | Move selected window to the top of the stack in the current workspace  |
| Mod + Ctrl + (⬆️⬇️)  | Switch between different layouts                                       |
| Mod + Shift + (⬅➡) | Switch between different workspaces                                    |
| Mod + Ctrl + L       | Lock the screen                                                        |
| Mod + Shift + X      | Exit LeftWM                                                            |
| Mod + Shift + R      | Reload LeftWM and its config                                           |
