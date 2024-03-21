{ ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza -lh";
      cat = "bat";

      nixrebuild = "sudo git -C /etc/nixos pull && sudo nixos-rebuild switch";
      nixtest = "sudo nixos-rebuild test --flake ~/.nix";
    };
  };

}
