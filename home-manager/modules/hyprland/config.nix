{
  imports = [
    ./keybinds.nix
    ./keyboard.nix
    ./monitor.nix
    ./layout.nix
    ./animations.nix
    ./cursor.nix
    ./decorations.nix
    ./window.nix
    ./environment.nix
    ./windowrule.nix
    ./autostart.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
    };
  };

}
