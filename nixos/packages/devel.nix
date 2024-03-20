{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    jetbrains.idea-ultimate
    nil
    nixpkgs-fmt

    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
      python-pkgs.selenium
    ]))

    openjdk8
    openjdk11
    (openjdk17.overrideAttrs (oldAttrs: {
      meta.priority = 100;
    }))

    git
    chromedriver
  ];

}