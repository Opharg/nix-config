{ pkgs, ... }:

let
  riderWrapper = pkgs.writeShellScriptBin "rider-nix-wrapper.sh" ''
    nix-shell ~/nix/nixos/modules/rider/rider-shell.nix --run "rider"
  '';

  riderDesktop = pkgs.makeDesktopItem {
    name = "rider-nix";
    exec = "${riderWrapper}/bin/rider-nix-wrapper.sh";
    icon = "rider";
    comment = "JetBrains Rider with Nix Shell";
    genericName = "Nix Shell";
    desktopName = "Rider";
    type = "Application";
    categories = [
      "Development"
      "IDE"
    ];
  };
in
{
  environment.systemPackages = [
    riderWrapper
    riderDesktop
    pkgs.jetbrains.rider
  ];
}
