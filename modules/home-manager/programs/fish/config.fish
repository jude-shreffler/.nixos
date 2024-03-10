set -x EDITOR nvim
set -x SHELL fish
set -x XDG_CONFIG_HOME /home/js/.config

alias rebuild="/home/js/.config/fish/rebuild.fish"
alias screenshot="/home/js/.config/leftwm/screenshot.fish"
alias addm="sudo /home/js/.config/fish/addmovie.fish"

if status is-interactive
  pfetch
end
