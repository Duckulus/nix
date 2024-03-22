let
  gtk-config = {
    gtk-application-prefer-dark-theme = 1;
  };
in
{ pkgs, ... }: {

  gtk = {
    enable = true;

    theme.package = pkgs.arc-theme;
    theme.name = "Arc-Dark";

    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";

    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus";

    gtk3.extraConfig = gtk-config;
    gtk4.extraConfig = gtk-config;
  };

  qt = {
    enable = true;
    platformTheme = "gtk";

    style.package = pkgs.adwaita-qt;
    style.name = "adwaita-dark";
  };
}
