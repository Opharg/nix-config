{
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, SPACE, exec," # capture keyboard layout swap

        # Applications
        #"$mainMod, B, exec, google-chrome-stable --password-store=kwallet5 # Open Chrome with Kwallet

        "$mainMod, B, exec, /run/current-system/sw/bin/zen-beta" # zen-beta, zen fails to get libEGL since ~Apr3; also specify sysrem package
        "$mainMod, Q, exec, kitty"
        "$mainMod, E, exec, kitty yazi"

        # Windows
        "$mainMod, W, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, T, togglefloating"
        "$mainMod, J, togglesplit"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod SHIFT, right, resizeactive, 100 0"
        "$mainMod SHIFT, left, resizeactive, -100 0"
        "$mainMod SHIFT, down, resizeactive, 0 100"
        "$mainMod SHIFT, up, resizeactive, 0 -100"
        "$mainMod, G, togglegroup" # Toggle window group
        "$mainMod, K, swapsplit"

        # Actions
        "$mainMod SHIFT, S, exec, flameshot gui --clipboard --path ~/Pictures/screenshots" # Take a screenshot
        "$mainMod CTRL, W, exec, waypaper" # Open wallpaper selector
        "$mainMod SHIFT, W, exec, waypaper --random" # Change the wallpaper
        "$mainMod, SUPER_L, exec, pkill rofi || rofi -show drun -replace -i" # Open application launcher
        "$mainMod SHIFT, B, exec, waybar" # Start waybar
        "$mainMod CTRL, B, exec, pkill waybar && pkill -f \"waybar-mediaplayer.py\"" # Quit waybar
        "$mainMod, L, exec, hyprlock" # Lock screen
        "$mainMod SHIFT, R, exec, hyprctl reload" # Reload hyprland config

        "$mainMod SHIFT, A, exec, $HYPRSCRIPTS/toggle-animations.sh" # Toggle animations
        "$mainMod ALT, W, exec, $HYPRSCRIPTS/wallpaper-automation.sh" # Start random wallpaper script
        "$mainMod SHIFT, H, exec, $HYPRSCRIPTS/hyprshade.sh" # Toggle screenshader

        # Workspaces
        "$mainMod, 1, workspace, 1" # Open workspace 1
        "$mainMod, 2, workspace, 2" # Open workspace 2
        "$mainMod, 3, workspace, 3" # Open workspace 3
        "$mainMod, 4, workspace, 4" # Open workspace 4
        # "$mainMod, 5, workspace, 5" # Open workspace 5
        # "$mainMod, 6, workspace, 6" # Open workspace 6
        # "$mainMod, 7, workspace, 7" # Open workspace 7
        # "$mainMod, 8, workspace, 8" # Open workspace 8
        # "$mainMod, 9, workspace, 9" # Open workspace 9
        # "$mainMod, 0, workspace, 10" # Open workspace 10

        "$mainMod SHIFT, 1, movetoworkspace, 1" # Move active window to workspace 1
        "$mainMod SHIFT, 2, movetoworkspace, 2" # Move active window to workspace 2
        "$mainMod SHIFT, 3, movetoworkspace, 3" # Move active window to workspace 3
        "$mainMod SHIFT, 4, movetoworkspace, 4" # Move active window to workspace 4
        # "$mainMod SHIFT, 5, movetoworkspace, 5" # Move active window to workspace 5
        # "$mainMod SHIFT, 6, movetoworkspace, 6" # Move active window to workspace 6
        # "$mainMod SHIFT, 7, movetoworkspace, 7" # Move active window to workspace 7
        # "$mainMod SHIFT, 8, movetoworkspace, 8" # Move active window to workspace 8
        # "$mainMod SHIFT, 9, movetoworkspace, 9" # Move active window to workspace 9
        # "$mainMod SHIFT, 0, movetoworkspace, 10" # Move active window to workspace 10

        "$mainMod, Tab, workspace, m+1" # Open next workspace
        "$mainMod SHIFT, Tab, workspace, m-1" # Open previous workspace

        # "$mainMod, mouse_down, workspace, e+1" # Open next workspace
        # "$mainMod, mouse_up, workspace, e-1" # Open previous workspace
        # "$mainMod CTRL, down, workspace, empty" # Open the next empty workspace

        # Passthrough SUPER KEY to Virtual Machine
        # "$mainMod, P, submap, passthru" # Passthrough SUPER key to virtual machine
        # submap = passthru
        # "SUPER, Escape, submap, reset" # Get SUPER key back from virtual machine
        # submap = reset

        # Fn keys
        # ", XF86MonBrightnessUp, exec, brightnessctl -q s +10%" # Increase brightness by 10%
        # ", XF86MonBrightnessDown, exec, brightnessctl -q s 10%-" # Reduce brightness by 10%
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%" # Increase volume by 5%
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%" # Reduce volume by 5%
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" # Toggle mute
        ", XF86AudioPlay, exec, playerctl play-pause" # Audio play pause
        ", XF86AudioPause, exec, playerctl pause" # Audio pause
        ", XF86AudioNext, exec, playerctl next" # Audio next
        ", XF86AudioPrev, exec, playerctl previous" # Audio previous
        ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle" # Toggle microphone
        ", XF86Calculator, exec, ~/.config/ml4w/settings/calculator.sh" # Open calculator
        ", XF86Lock, exec, hyprlock" # Open screenlock
        ", XF86Tools, exec, kitty"

        # ", code:238, exec, brightnessctl -d smc::kbd_backlight s +10
        # ", code:237, exec, brightnessctl -d smc::kbd_backlight s 10-
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow" # Move window with the mouse
        "$mainMod, mouse:273, resizewindow" # Resize window with the mouse
      ];
    };
  };
}
