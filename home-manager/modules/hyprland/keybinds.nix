{
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, SPACE, exec,"

        # Applications
        #"$mainMod, B, exec, google-chrome-stable --password-store=kwallet5 # Open Chrome with Kwallet

        "$mainMod, B, exec, /run/current-system/sw/bin/zen-beta" # zen-beta, zen fails to get libEGL since ~Apr3; also specify sysrem package
        "$mainMod, Q, exec, kitty"
        "$mainMod, E, exec, kitty yazi"

        "$mainMod CTRL, E, exec, ~/.config/ml4w/settings/emojipicker.sh # Open the emoji picker"
        "$mainMod CTRL, C, exec, ~/.config/ml4w/settings/calculator.sh # Open the calculator"

        # Windows
        "$mainMod, W, killactive # Kill active window"
        "$mainMod, F, fullscreen # Set active window to fullscreen"
        "$mainMod, T, togglefloating # Toggle active windows into floating mode"
        "$mainMod, J, togglesplit # Toggle split"
        "$mainMod, left, movefocus, l # Move focus left"
        "$mainMod, right, movefocus, r # Move focus right"
        "$mainMod, up, movefocus, u # Move focus up"
        "$mainMod, down, movefocus, d # Move focus down"
        "$mainMod SHIFT, right, resizeactive, 100 0 # Increase window width with keyboard"
        "$mainMod SHIFT, left, resizeactive, -100 0 # Reduce window width with keyboard"
        "$mainMod SHIFT, down, resizeactive, 0 100 # Increase window height with keyboard"
        "$mainMod SHIFT, up, resizeactive, 0 -100 # Reduce window height with keyboard"
        "$mainMod, G, togglegroup # Toggle window group"
        "$mainMod, K, swapsplit # Swapsplit"

        # Actions
        "$mainMod SHIFT, A, exec, $HYPRSCRIPTS/toggle-animations.sh # Toggle animations"
        "$mainMod, PRINT, exec, flameshot gui --clipboard --path ~/Pictures/screenshots # Take a screenshot"
        "$mainMod SHIFT, S, exec, flameshot gui --clipboard --path ~/Pictures/screenshots # Take a screenshot"
        "$mainMod CTRL, Q, exec, ~/.config/ml4w/scripts/wlogout.sh" # Start wlogout
        "$mainMod SHIFT, W, exec, waypaper --random" # Change the wallpaper
        "$mainMod CTRL, W, exec, waypaper" # Open wallpaper selector
        "$mainMod ALT, W, exec, $HYPRSCRIPTS/wallpaper-automation.sh" # Start random wallpaper script
        "$mainMod, SUPER_L, exec, pkill rofi || rofi -show drun -replace -i" # Open application launcher
        "$mainMod CTRL, K, exec, $HYPRSCRIPTS/keybindings.sh" # Show keybindings
        "$mainMod SHIFT, B, exec, waybar" # Reload waybar
        "$mainMod CTRL, B, exec, pkill waybar && pkill -f \"waybar-mediaplayer.py\"" # Toggle waybar
        "$mainMod SHIFT, R, exec, $HYPRSCRIPTS/loadconfig.sh" # Reload hyprland config
        "$mainMod, V, exec, $SCRIPTS/cliphist.sh" # Open clipboard manager
        "$mainMod CTRL, T, exec, ~/.config/waybar/themeswitcher.sh" # Open waybar theme switcher
        "$mainMod CTRL, S, exec, ~/.config/ml4w/apps/ML4W_Dotfiles_Settings-x86_64.AppImage" # Open ML4W Dotfiles Settings app
        "$mainMod SHIFT, H, exec, $HYPRSCRIPTS/hyprshade.sh" # Toggle screenshader
        "$mainMod ALT, G, exec, $HYPRSCRIPTS/gamemode.sh" # Toggle game mode
        "$mainMod, Z, exec, missioncenter" # Open Mission Center
        "$mainMod, L, exec, hyprlock" # Open Mission Center

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

        # "$mainMod CTRL, 1, exec, $HYPRSCRIPTS/moveTo.sh 1" # Move all windows to workspace 1
        # "$mainMod CTRL, 2, exec, $HYPRSCRIPTS/moveTo.sh 2" # Move all windows to workspace 2
        # "$mainMod CTRL, 3, exec, $HYPRSCRIPTS/moveTo.sh 3" # Move all windows to workspace 3
        # "$mainMod CTRL, 4, exec, $HYPRSCRIPTS/moveTo.sh 4" # Move all windows to workspace 4
        # "$mainMod CTRL, 5, exec, $HYPRSCRIPTS/moveTo.sh 5" # Move all windows to workspace 5
        # "$mainMod CTRL, 6, exec, $HYPRSCRIPTS/moveTo.sh 6" # Move all windows to workspace 6
        # "$mainMod CTRL, 7, exec, $HYPRSCRIPTS/moveTo.sh 7" # Move all windows to workspace 7
        # "$mainMod CTRL, 8, exec, $HYPRSCRIPTS/moveTo.sh 8" # Move all windows to workspace 8
        # "$mainMod CTRL, 9, exec, $HYPRSCRIPTS/moveTo.sh 9" # Move all windows to workspace 9
        # "$mainMod CTRL, 0, exec, $HYPRSCRIPTS/moveTo.sh 10" # Move all windows to workspace 10

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
        ", XF86Tools, exec, $(cat ~/.config/ml4w/settings/terminal.sh) --class dotfiles-floating -e ~/.config/ml4w/apps/ML4W_Dotfiles_Settings-x86_64.AppImage" # Open ML4W Dotfiles Settings app

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
