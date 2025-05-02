{ pkgs, ... }:
let
  figtree = pkgs.callPackage ./figtree/default.nix { };
in
{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.js = {
      # NOTE: change username

      isNormalUser = true;
      description = "js"; # NOTE: change username
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "libvirtd"
      ];
      packages = [
        figtree
      ];
    };
  };

  # Enable automatic login for the user.
  # services.getty.autologinUser = "js"; # NOTE: change username
}
