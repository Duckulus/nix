{ pkgs }:

pkgs.writeShellScriptBin "sync" ''
  git -C ~/.nix add .
  git -C ~/.nix commit -m "$(${pkgs.rofi-wayland}/bin/rofi -dmenu -p "Enter commit message")"
  git push  
''
