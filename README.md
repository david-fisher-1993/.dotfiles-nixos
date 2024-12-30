

cd .dotfiles-nixos
sudo nixos-rebuild switch --flake .#david

home-manager switch --flake .#david@nixos




hyprland.conf
  remove monitor=,preferred,auto,auto
  at top add #!/usr/bin/env bash
  run-once: nm-applet --indicator


# screenshot your desktop with selection
grim -l 0 -g "$(slurp)" - | wl-copy

pkgs.grim - screenshot utility
pkgs.slupr - select utility
pkgs.wl-copy - xclip alternative

