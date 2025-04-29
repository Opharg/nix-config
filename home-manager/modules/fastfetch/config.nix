{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;

    settings = {
      logo = {
        padding = {
          top = 1;
          left = 1;
          right = 0;
        };
        source = "/$HOME/nix/home-manager/modules/fastfetch/nixos-logo.txt";
        width = 43;
        type = "auto";
      };
      display = {
        separator = " ";
      };
      modules = [

        {
          # NOTE: adjust "─" count in the back, depending on username/hostname len.
          format = "{#1}{#keys}╭{user-name-colored}{at-symbol-colored}{host-name-colored}{#keys}────╮";
          type = "title";
        }
        {
          key = "│ {#34}{icon} Distro   {#keys}│";
          type = "os";
        }
        {
          key = "│ {#31} Kernel   {#keys}│";
          type = "kernel";
        }
        {
          key = "│ {#33}󰅐 Uptime   {#keys}│";
          type = "uptime";
        }
        {
          key = "│ {#34}{icon} Processes{#keys}│";
          type = "processes";
        }
        {
          key = "│ {#34}{icon} Packages {#keys}│";
          type = "packages";
        }
        {
          key = "│ {#34}{icon} Shell    {#keys}│";
          type = "shell";
        }
        {
          key = "│ {#34}{icon} DE       {#keys}│";
          type = "de";
        }
        {
          key = "│ {#34}{icon} WM       {#keys}│";
          type = "wm";
        }
        {
          key = "│ {#34}{icon} Terminal {#keys}│";
          type = "terminal";
        }
        {
          key = "│ {#34}{icon} CPU      {#keys}│";
          format = "{name}";
          type = "cpu";
          temp = true;
        }
        {
          key = "│ {#34}{icon} GPU      {#keys}│";
          format = "{name}";
          type = "gpu";
          driverSpecific = false;
          temp = true;
        }
        {
          key = "│ {#34}{icon} Memory   {#keys}│";
          type = "memory";
        }
        {
          key = "│ {#34}{icon} Swap     {#keys}│";
          type = "swap";
        }
        {
          key = "│ {#34}{icon} IP       {#keys}│";
          type = "localip";
          showIpv6 = false;
          showMac = false;
          showSpeed = false;
          showMtu = false;
          showLoop = false;
          showFlags = false;
          showAllIps = false;
        }
        {
          key = "├────────────┤";
          type = "custom";
        }
        {
          key = "│ {#34}{icon} {name} {#keys}";
          format = "{#keys}│ {#white}{size-used} / {size-total} ({size-percentage})";
          type = "disk";
          keyWidth = 14;
        }
        {
          key = "│ {#34}{icon} Btrfs    {#keys}│";
          type = "btrfs";
        }
        {
          key = "│ {#34}{icon} ZPool    {#keys}│";
          type = "zpool";
        }
        {
          key = "╰────────────╯";
          type = "custom";
        }
      ];
    };
  };
}
