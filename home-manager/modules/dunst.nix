{  pkgs, ... }:
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    waylandDisplay = "$WAYLAND_DISPLAY";

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    settings = {
      global = {
        monitor = 0;
        follow = "none";

        width = 300;
        height = "(0, 300)";
        origin = "top-center";
        offset = "10x10";
        scale = 0;
        notification_limit = 20;

        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 5;

        icon_corner_radius = 5;
        indicate_hidden = true;
        transparency = 30;
        separator_height = 2;
        padding = 6;
        horizontal_padding = 6;
        text_icon_padding = 0;
        corner_radius = 6;
        frame_width = 1;
        frame_color = "#ffffff";
        gap_size = 0;
        separator_color = "frame";

        sort = "yes";
        font = "figtree";
        line_height = 1;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";

        enable_recursive_icon_lookup = true;
        icon_theme = "Papirus-Dark, Adwaita, breeze";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;

        sticky_history = "yes";
        history_length = 20;

        dmenu = "dmenu -p dunst";
        browser = "xdg-open";
        ignore_dbusclose = true;
        force_xwayland = false;
        force_xinerama = false;

        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "do_action";
        mouse_right_click = "close_all";

        title = "Dunst";
        class = "Dunst";

      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#000000CC";
        foreground = "#888888";
        timeout = 10;
      };
      urgency_normal = {
        background = "#000000CC";
        foreground = "#ffffff";
        timeout = 15;
      };
      urgency_critical = {
        background = "#900000CC";
        foreground = "#ffffff";
        frame_color = "#ffffff";
        timeout = 0;
      };

    };
  };
}
