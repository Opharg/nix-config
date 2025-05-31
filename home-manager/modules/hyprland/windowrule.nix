{
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        # Pavucontrol floating
        "float,class:^(org.pulseaudio.pavucontrol.*)$"
        "size 700 600,class:(.*org.pulseaudio.pavucontrol.*)"
        "center,class:(.*org.pulseaudio.pavucontrol.*)"
        "pin,class:(.*org.pulseaudio.pavucontrol.*)"
        "dimaround,class:(.*org.pulseaudio.pavucontrol.*)"

        # pwvucontrol
        "float,class:^(com.saivert.pwvucontrol.*)$"
        "size 700 600,class:(.*com.saivert.pwvucontrol.*)"
        "center,class:(.*com.saivert.pwvucontrol.*)"
        "pin,class:(.*com.saivert.pwvucontrol.*)"
        "dimaround,class:(.*com.saivert.pwvucontrol.*)"

        # waypaper
        "float,class:^(waypaper)$"
        "size 850 600,class:^(waypaper)$"
        "center,class:^(waypaper)$"
        "pin,class:^(waypaper)$"
        "dimaround,class:^(waypaper)$"

        # more floats
        "float,class:^(blueman-manager)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(qalculate-gtk)$"

        # kitty
        # "float, title:^(kitty)$"
        "size 1000 600, class:^(kitty)$"
        "opacity 0.9 override 0.9 override 0.9 override, class:^(kitty)$" # 0.81 because it's a multiplier on the global opacity

        # Browser Picture in Picture
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "move 69.5% 4%, title:^(Picture-in-Picture)$"

        # Flameshot
        "noanim, class:^(flameshot)$"
        "float, class:^(flameshot)$"
        "move 0 0, class:^(flameshot)$"
        "pin, class:^(flameshot)$"
        "monitor 0, class:^(flameshot)$" # has to be the leftmost monitor

        # others
        "workspace 3,class:^(Spotify)$"
        "workspace 2,class:^(discord)$"
        "opaque 1, class:^(jetbrains-pycharm)$"
        "opaque 1, class:^(jetbrains-webstorm)$"

        # "fullscreen" when only 1 window is open
        "noborder, onworkspace:w[t1]"
        "rounding 0, onworkspace:w[t1]"
      ];
      layerrule = [
        "blur,waybar"
        "dimaround,swaync-control-center" # sleep 5 && hyprctl layers
      ];
    };
  };
}
