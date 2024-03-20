{ ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ls = "eza -lh";
      cat = "bat";

      rebuild = "sudo git -C /etc/nixos pull && sudo nixos-rebuild switch";
    };
  };

}
