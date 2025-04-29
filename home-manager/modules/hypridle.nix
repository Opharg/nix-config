{ pkgs, ... }:
{
  programs.hypridle = {
    enable = true;
    package = pkgs.hypridle;

    settings = {
      general = {
        # ignore_dbus_inhibit = false; # Uncomment if needed
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          # Screenlock
          timeout = 600;
          on-timeout = "loginctl lock-session";
        }
        {
          # DPMS
          timeout = 660;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          # Suspend
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
