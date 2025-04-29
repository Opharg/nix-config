{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  # duplicate from system package, because home-manager didn't want the package in gtk.nix.....
  nixpkgs.overlays = [
    (self: super: {
      figtree = super.callPackage ../nixos/modules/figtree/default.nix { };
    })
  ];

  news.display = "silent";

  home = {
    username = "js"; # NOTE: change username
    homeDirectory = "/home/js"; # NOTE: change username
    stateVersion = "24.11";

    packages = with pkgs; [
      gsettings-desktop-schemas

      figtree
    ];
    
    sessionVariables = {
      # TODO: gsettings schema: Somehow make this more dynamic
      GSETTINGS_SCHEMA_DIR = "$HOME/.nix-profile/share/gsettings-schemas/gsettings-desktop-schemas-47.1/glib-2.0/schemas";
    };
  };

}
