# TODO: fix

{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  wayland.windowManager.hyprland = {
    settings = {
      env = [ "XCURSOR_SIZE, 24" ];
    };
  };
}
