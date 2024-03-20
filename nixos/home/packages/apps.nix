{ pkgs, unstable, ... }: {
  home.packages = with pkgs; [
    unstable.vesktop
    firefox
    pavucontrol
    chromium
    pinta
    dolphin
    zoom-us

    neofetch
    eza
    bat
    wf-recorder
    mpv
  ];
}
