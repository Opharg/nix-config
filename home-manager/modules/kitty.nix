{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    shellIntegration.enableZshIntegration = true;

    font = {
      package = pkgs.iosevka;
      name = "Iosevka";
      size = 12;
    };

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      disable_ligatures = "never";
      sync_to_monitor = true;

    };
  };
}
