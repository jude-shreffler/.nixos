set -x EDITOR nvim
set -x SHELL fish
set -x XDG_CONFIG_HOME /home/js/.config

alias rebuild="/home/js/.config/fish/functions/rebuild.fish"
alias garbage="sudo nix-collect-garbage --delete-older-than 14d"
alias screenshot="/home/js/.config/fish/functions/screenshot.fish"
alias addm="sudo /home/js/.config/fish/functions/addmovie.fish"
alias tr="transmission-remote"

if status is-interactive
    pfetch
end
