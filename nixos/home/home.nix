{ pkgs, ... }:

{
  home.username = "aminh";
  home.homeDirectory = "/home/aminh";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.file = { };

  home.sessionVariables = { };

  home.packages = [
    (import ./scripts/nixsync.nix { inherit pkgs; })
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  imports = [
    ./packages
    ./wayland
    ./git.nix
    ./zsh.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
