{ pkgs, ... }:
let
  wlogout-style = builtins.readFile ./wlogout-style.css;
in
{
  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;

    style = wlogout-style;

    layout = [
      {
        label = "lock";
        action = "~/nix/home-manager/modules/wlogout/power.sh lock";
        text = "Lock";
      }
      {
        label = "logout";
        action = "~/nix/home-manager/modules/wlogout/power.sh exit";
        text = "Log Out";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "~/nix/home-manager/modules/wlogout/power.sh suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "~/nix/home-manager/modules/wlogout/power.sh reboot";
        text = "Restart";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "~/nix/home-manager/modules/wlogout/power.sh shutdown";
        text = "Power Off";
        keybind = "s";
      }
    ];

  };

}
