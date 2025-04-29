{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    syntaxHighlighting.enable = true;

    plugins = with pkgs; [
      {
        name = "zsh-autocomplete";
        src = zsh-autocomplete;
        file = "share/zsh-autocomplete/zsh-autocomplete.plugin.zsh";
      }

    ];

    shellAliases =
      let
        flakeDir = "~/nix";
        EDITOR = "nvim";
      in
      {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd = "sudo nix flake update --flake ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

        hms = "home-manager switch --flake ${flakeDir}";
        hmn = "home-manager news --flake ${flakeDir}";

        conf = "nvim ${flakeDir}/nixos/configuration.nix";
        pkgs = "nvim ${flakeDir}/nixos/packages.nix";

        v = "${EDITOR}";
        vi = "${EDITOR}";
        vim = "${EDITOR}";

        ls = "eza --icons=auto";
        ll = "eza -al --icons=always";
        lt = "eza -a --tree --level=1 --icons=always";

        shutdown = "shutdown -n 0";
      };

    initContent = ''
      if [ -z "''${WAYLAND_DISPLAY}" ] && [ "''${XDG_VTNR}" -eq 1 ]; then
        dbus-run-session Hyprland
      fi
      bindkey "''${key[Up]}" up-line-or-search
      fastfetch
    '';

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "copyfile"
        "copybuffer"
        "dirhistory"
      ];
      theme = "agnoster";
    };

  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
