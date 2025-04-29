{ pkgs, ... }:
let
  waybar-style = builtins.readFile ./waybar-style.css;
in
{

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    style = waybar-style;

    settings = [
      {

        #General Settings
        layer = "top";
        margin-top = 1;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 0;

        # Load Modules
        #include = [
        #  "~/.config/ml4w/settings/waybar-quicklinks.json"
        #];

        # Modules Left
        modules-left = [
          "hyprland/window"
        ];

        # Modules Center
        modules-center = [
          "custom/empty"
          "hyprland/workspaces"
          "custom/notification"
        ];

        # Modules Right
        modules-right = [
          "custom/spotify"

          "custom/updates"
          "pulseaudio"
          #"backlight"
          #"bluetooth"
          #"battery"
          "network"
          "cpu"
          "memory"
          "hyprland/language"
          "tray"
          "custom/hypridle"
          "custom/exit"
          "clock"
        ];

        # Empty NOTE: adjust to center specifically workspaces
        "custom/empty" = {
          "format" = "        ";
        };
        # Workspaces
        "hyprland/workspaces" = {
          "on-scroll-up" = "hyprctl dispatch workspace r-1";
          "on-scroll-down" = "hyprctl dispatch workspace r+1";
          "on-click" = "activate";
          "active-only" = false;
          "all-outputs" = true;
          "format" = "{}";
          "format-icons" = {
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
          "persistent-workspaces" = {
            "*" = 2;
          };
        };

        # Hyprland Window
        "hyprland/window" = {
          "rewrite" = {
            "(.*) - Brave" = "$1";
            "(.*) - Chromium" = "$1";
            "(.*) - Brave Search" = "$1";
            "(.*) - Outlook" = "$1";
            "(.*) Microsoft Teams" = "$1";
          };
          "separate-outputs" = true;
        };

        # Updates Count
        "custom/updates" = {
          "format" = "  {}";
          "escape" = true;
          "return-type" = "json";
          "exec" = "~/.config/ml4w/scripts/updates.sh";
          "interval" = 1800;
          "on-click" =
            "$(cat ~/.config/ml4w/settings/terminal.sh) --class dotfiles-floating -e ~/.config/ml4w/scripts/installupdates.sh";
          "on-click-right" = "~/.config/ml4w/settings/software.sh";
        };

        # Power Menu
        "custom/exit" = {
          "format" = "";
          "on-click" = "~/nix/home-manager/modules/wlogout/wlogout.sh";
          "on-click-right" = "hyprlock";
          "tooltip-format" = "Left: Power menu\nRight: Lock screen";
        };

        # Hypridle inhibitor
        "custom/hypridle" = {
          "format" = "";
          "return-type" = "json";
          "escape" = true;
          "exec-on-event" = true;
          "interval" = 60;
          "exec" = "~/.config/hypr/scripts/hypridle.sh status";
          "on-click" = "~/.config/hypr/scripts/hypridle.sh toggle";
        };

        # System tray
        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };

        # Clock
        "clock" = {
          "format" = "{:%H:%M %a}";
          "on-click" = "ags toggle calendar";
          "timezone" = "";
          "tooltip" = false;
        };

        # CPU
        "cpu" = {
          "format" = "  {usage}% ";
          "on-click" = "kitty htop";
        };

        # Memory
        "memory" = {
          "format" = "  {}% ";
          "on-click" = "kitty htop";
        };

        # Keyboard layout
        "hyprland/language" = {
          "format" = "{}";
          "format-en" = "🇺🇸";
          "format-de" = "🇩🇪";
          "on-click" = "hyprctl switchxkblayout lioncast-lk20-keybord-lioncast-lk20-keybord next";
          "on-scroll-up" = "hyprctl switchxkblayout lioncast-lk20-keybord-lioncast-lk20-keybord prev";
          "on-scroll-down" = "hyprctl switchxkblayout lioncast-lk20-keybord-lioncast-lk20-keybord next";
        };

        # Network
        "network" = {
          "format" = "{ifname}";
          "format-wifi" = " {essid} ({signalStrength}%)";
          "format-ethernet" = "  {ifname}";
          "format-disconnected" = "Disconnected ⚠";
          "tooltip-format" = " {ifname} via {gwaddri}";
          "tooltip-format-wifi" =
            "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
          "tooltip-format-ethernet" =
            " {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
          "on-click" = "kitty 
          nmtui";
          "on-click-right" = "~/.config/ml4w/scripts/nm-applet.sh toggle";
        };

        # Battery
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = "  {capacity}%";
          "format-plugged" = "  {capacity}%";
          "format-alt" = "{icon}  {time}";
          "format-icons" = [
            " "
            " "
            " "
            " "
            " "
          ];
        };

        # Pulseaudio
        "pulseaudio" = {
          "format" = "{icon}  {volume}%";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = " ";
            "hands-free" = " ";
            "headset" = " ";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pwvucontrol";
        };

        # Bluetooth
        "bluetooth" = {
          "format" = " {status}";
          "format-disabled" = "";
          "format-off" = "";
          "interval" = 30;
          "on-click" = "blueman-manager";
          "format-no-controller" = "";
        };

        # backlight
        "backlight" = {
          "format" = "{icon} {percent}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          "scroll-step" = 1;
        };

        # notifications
        "custom/notification" = {
          "tooltip-format" = "Left: Notifications\nRight: Do not disturb";
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            "none" = "";
            "dnd-notification" = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" =
              "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            "dnd-inhibited-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };

        # Spotify-mediaplayer
        "custom/spotify" = {
          # TODO: Creates new instances every time waybar is closed until Spotify changes song...
          # NOTE: may have to make 'waybar-mediaplayer.py' executable
          "exec" =
            ''nix-shell -p gobject-introspection playerctl 'python3.withPackages (ps: with ps; [ pygobject3 ])' --run "python3 ~/nix/home-manager/modules/waybar/waybar-mediaplayer.py --player spotify"'';
          "format" = "{}  ";
          "return-type" = "json";
          "on-click" = "playerctl --player=spotify play-pause";
          "on-scroll-up" = "playerctl --player=spotify next";
          "on-scroll-down" = "playerctl --player=spotify previous";
        };

      }

    ];

  };
}
