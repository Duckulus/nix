{ pkgs, unstable, ... }: {
  home.packages = with pkgs; [
    firefox
    pavucontrol
    chromium
    pinta

    neofetch
    eza
    bat
    unstable.webcord-vencord
  ];
}
