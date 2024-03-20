{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    webcord-vencord
    pavucontrol
    chromium
    pinta

    neofetch
    eza
    bat
  ];
}
