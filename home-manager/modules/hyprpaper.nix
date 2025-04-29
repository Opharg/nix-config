{ pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;

    settings = {
      splash = false;
      ipc = "on";
      preload = [ ];
      wallpaper = [ ];
    };
  };
}
