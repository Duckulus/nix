{ pkgs, unstable, ... }: {
  home.packages = with pkgs; [
    unstable.vesktop
    firefox
    pavucontrol
    chromium
    pinta
    xfce.thunar
    zoom-us
    thunderbird
    obsidian
    vmware-horizon-client
    dbeaver
    filezilla
    putty
    xournalpp

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
