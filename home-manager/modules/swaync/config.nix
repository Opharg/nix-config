{ pkgs, ... }:
let
  swaync-style = builtins.readFile ./swaync-style.css;
in
{
  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;
    style = swaync-style;

    settings = {
      "$schema" = "/run/current-system/sw/etc/xdg/swaync/configSchema.json";
      positionX = "center";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "user";
      control-center-margin-top = 13;
      control-center-margin-bottom = 0;
      control-center-margin-right = 14;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 24;
      notification-body-image-height = 100;
      notification-body-image-width = 100;
      notification-window-width = 300;
      timeout = 6;
      timeout-low = 3;
      timeout-critical = 0;
      fit-to-screen = false;
      control-center-width = 400;
      control-center-height = 720;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "title"
        "notifications"
        "dnd"
      ];
      
      widget-config = {
        "title" = {
          "text" = "Notifications";
          "clear-all-button" = true;
          "button-text" = "Clear";
        };
        "dnd" = {
          "text" = "Do Not Disturb";
        };
        "label" = {
          "max-lines" = 1;
          "text" = "Notification";
        };
      };

      notification-visibility = {
        "spotify-transient" = {
          app-name = "Spotify";
          state = "transient";
        };

      };
    };
  };
}
