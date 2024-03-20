{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    jetbrains.idea-ultimate
    nil
    nixpkgs-fmt

    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.requests
      python-pkgs.selenium
    ]))
    openjdk11

    git
    chromedriver
  ];

}