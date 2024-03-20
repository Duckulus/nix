{ config, pkgs, ... }:

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


  home.packages = with pkgs; [
    eza
    bat
  ];

  home.file = {

  };

  home.sessionVariables = {

  };

  programs.git = {
    enable = true;
    userName = "aminh";
    userEmail = "amin@haddou.net";
    aliases = {
      s = "status";
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza -lh";
      cat = "bat";
    };
    promptInit = ''
      prompt off
      PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "af-magic";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
