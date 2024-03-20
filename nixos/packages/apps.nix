{ pkgs, ... }: {
  home.packages = with pkgs; [
    webcord-vencord
    pavucontrol
    chromium
    pinta

    neofetch
    eza
    bat
  ];
}
