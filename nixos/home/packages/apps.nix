{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    pavucontrol
    chromium
    pinta
    dolphin

    neofetch
    eza
    bat
    vesktop
  ];
}
