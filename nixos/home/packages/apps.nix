{ pkgs, unstable, ... }: {
  home.packages = with pkgs; [
    unstable.vesktop
    firefox
    pavucontrol
    chromium
    pinta
    pcmanfm
    zoom-us
    thunderbird
    obsidian
    vmware-horizon-client
    dbeaver
    filezilla
    putty

    neofetch
    fortune
    eza
    bat
    wf-recorder
    mpv
    grim
    slurp
    feh
    wl-clipboard
    hyprpaper
    unstable.hypridle
    unstable.hyprlock
  ];
}
