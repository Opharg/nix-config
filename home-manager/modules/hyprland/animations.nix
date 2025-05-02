{
  wayland.windowManager.hyprland = {
    settings = {
      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "linear, 1, 1, 1, 1"
          "easeIn, 0.32, 0, 0.67, 0"
        ];

        animation = [
          "windows, 1, 6, wind, slide ]"
          "windowsIn, 0, 2, easeIn, slide"
          "windowsOut, 1, 5,winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, default"
          "borderangle, 1, 30, default, once"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };
    };
  };
}
