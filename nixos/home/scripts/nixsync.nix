{ pkgs }:

pkgs.writeShellScriptBin "nixsync" ''
  git -C ~/.nix add .
  git -C ~/.nix commit -m "$(${pkgs.rofi-wayland}/bin/rofi -dmenu -p "Enter commit message")"
  git -C ~/.nix push  
''
