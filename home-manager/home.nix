{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  news.display = "silent";
  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
  home = {
    username = "js"; # NOTE: change username
    homeDirectory = "/home/js"; # NOTE: change username
    stateVersion = "24.11";

    sessionVariables = {
      # TODO: gsettings schema: broken due to no more separate HM install
      #GSETTINGS_SCHEMA_DIR = "$HOME/.nix-profile/share/gsettings-schemas/gsettings-desktop-schemas-47.1/glib-2.0/schemas";
    };
  };
}
