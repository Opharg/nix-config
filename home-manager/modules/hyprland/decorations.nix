{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        rounding = 1;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 2;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          xray = true;
          # blurls = waybar
        };

        shadow = {
          enabled = true;
          range = 300;
          render_power = 4;
          color = [127 17 224 1];
          offset = "0 40";
          scale = 0.9;
        };
      };
    };
  };
}
