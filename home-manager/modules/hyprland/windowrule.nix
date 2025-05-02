{
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        # Pavucontrol floating
        "float,class:^(org.pulseaudio.pavucontrol.*)$"
        "size 700 600,class:(.*org.pulseaudio.pavucontrol.*)"
        "center,class:(.*org.pulseaudio.pavucontrol.*)"
        "pin,class:(.*org.pulseaudio.pavucontrol.*)"

        # pwvucontrol
        "float,class:^(com.saivert.pwvucontrol.*)$"
        "size 700 600,class:(.*com.saivert.pwvucontrol.*)"
        "center,class:(.*com.saivert.pwvucontrol.*)"
        "pin,class:(.*com.saivert.pwvucontrol.*)"

        # more floats
        "float,class:^(blueman-manager)$"
        "float,class:^(waypaper)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(qalculate-gtk)$"

        # kitty
        # "float, title:^(kitty)$"
        "size 1000 600, class:^(kitty)$"

        # Browser Picture in Picture
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "move 69.5% 4%, title:^(Picture-in-Picture)$"

        # Flameshot
        "noanim, class:^(flameshot)$"
        "float, class:^(flameshot)$"
        "move 0 0, class:^(flameshot)$"
        "pin, class:^(flameshot)$"
        "monitor 0, class:^(flameshot)$"  # has to be the leftmost monitor

        # others
        "workspace 3,class:^(Spotify)$"
        "workspace 2,class:^(discord)$"
        "opaque 1, class:^(jetbrains-pycharm)$"
        "opaque 1, class:^(jetbrains-webstorm)$"
      ];
      layerrule = [
        "blur,waybar"
        "dimaround,swaync"
      ];
    };
  };
}
