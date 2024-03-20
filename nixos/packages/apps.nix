{pkgs, ...}: {
  home.packages = with pkgs; [
    webcord-vencord
    neofetch
    pavucontrol
    chromium
    pinta
  ];
}