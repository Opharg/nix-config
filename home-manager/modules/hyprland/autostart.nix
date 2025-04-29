{ config, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland"
        "hypridle"
        # UI
        "waybar"
        "waypaper --wallpaper '~/Pictures/wallpapers/wallpaper1.jpg'"

        # Load Notification Daemon
        "swaync"

        #"hypridle"  # issues with browser timing out?

        # Theming
        "hyprctl setcursor Bibata-Modern-Classic 24"
        "gsettings set org.gnome.desktop.interface cursor-theme '${config.home.pointerCursor.name}'"
        "gsettings set org.gnome.desktop.interface cursor-size ${toString config.home.pointerCursor.size}"

        # Programs
        "discord"
        "spotify"
      ];

      exec = [
        # auto-mount removable drives
        #"/usr/bin/python /sbin/udiskie"
        #"udiskie &"

        # force active workspace, because in my setup the HDMI is considered primary over DP
        "hyprctl dispatch focusmonitor DP-1" # NOTE: May need to be changed
      ];

    };
  };
}
