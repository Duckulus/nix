{ pkgs, ... }: {
  home.packages = with pkgs; [
    vscode
    jetbrains.idea-ultimate
    nil
    nixpkgs-fmt

    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
      python-pkgs.selenium
    ]))

    (openjdk8.overrideAttrs (oldAttrs: {
      meta.priority = 100;
    }))
    (openjdk11.overrideAttrs (oldAttrs: {
      meta.priority = 200;
    }))
    (openjdk17.overrideAttrs (oldAttrs: {
      meta.priority = 300;
    }))

    git
    chromedriver
  ];

}
