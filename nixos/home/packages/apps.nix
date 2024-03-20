{ pkgs, unstable, ... }: {
  home.packages = with pkgs; [
    unstable.vesktop
    firefox
    pavucontrol
    chromium
    pinta
    dolphin
    zoom-us
    thunderbird

    neofetch
    eza
    bat
    wf-recorder
    mpv
    grim
    slurp
    feh
    wl-clipboard
  ];
}
