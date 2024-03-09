set -x EDITOR nvim
set -x SHELL fish
set -x XDG_CONFIG_HOME /home/js/.config

alias rebuild="~/.config/leftwm/rebuild.fish"
alias screenshot="~/.config/leftwm/screenshot.fish"

if status is-interactive
  pfetch
end
