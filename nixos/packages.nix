{
  pkgs,
  inputs,
  system,
  lib,
  ...
}:
let
  #figtree = pkgs.callPackage ./modules/figtree/default.nix { };
in
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "python-2.7.18.8"
      "electron-25.9.0"
    ];
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "teamspeak-server"
      ];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libxcrypt-legacy
    # icu  # replaces modules/rider/rider.nix, might uncomment, if I run into this more often
  ];

  # appimages for posterity
  programs.appimage.enable = false;
  programs.appimage.binfmt = true;
  programs.appimage.package = pkgs.appimage-run.override {
    extraPkgs = pkgs: [
      pkgs.icu
    ];
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 5175 ];
  };

  # services.teamspeak3 = {
  #   enable = true;
  #   openFirewall = true;
  #   openFirewallServerQuery = true;
  # };

  nixpkgs.overlays = [
    #  inputs.kickstart-nix-nvim.overlays.default
    (final: prev: {
      flameshot = prev.flameshot.override {
        enableWlrSupport = true;
      };
    })
    (final: prev: {
      figtree = prev.callPackage ./modules/figtree/default.nix { };
    })
  ];

  environment.systemPackages = with pkgs; [
    # Desktop apps
    calibre
    discord
    firefox
    inputs.zen-browser.packages."${system}".twilight
    kitty
    krita
    mpv
    obs-studio
    pavucontrol
    #pwvucontrol  # Doesn't respect darkmode
    spotify
    spotifywm
    yazi
    flameshot
    

    # TeamSpeak
    teamspeak6-client

    # Gaming
    gamemode
    # mangohud
    # protonup-qt

    # CLI
    bash
    chafa
    eza
    fastfetch
    fd
    ffmpeg
    figlet
    fzf
    htop
    imagemagick
    jq
    ntfs3g
    p7zip
    playerctl
    poppler
    ripgrep
    starship
    udisks
    unzip
    usbutils
    util-linux
    wl-clipboard
    zoxide
    zsh-autocomplete
    go-mtpfs
    wget

    # Python
    (python3.withPackages (
      python-pkgs: with python-pkgs; [
        pip
        regex
        pygobject3
      ]
    ))

    # Programming
    git
    git-lfs
    jetbrains-toolbox
    neovim
    nixd
    nixfmt-rfc-style
    vscode
    

    # Wayland
    rofi-wayland
    wl-clipboard

    # Styling
    bibata-cursors
    glib
    gnome-themes-extra
    papirus-icon-theme
    gsettings-desktop-schemas
    adwaita-icon-theme

    # WM
    brightnessctl
    dmenu
    hyprland
    hyprlock
    #hyprpaper
    libnotify
    rofi-wayland
    swaynotificationcenter
    waybar
    waypaper
    swww
    wlogout

    # Other
    gnome-keyring
    udiskie

    # NVIDIA
    egl-wayland
    glxinfo
    libGL
    libglvnd
    libva-utils
    libvdpau-va-gl
    mesa
    nvidia-vaapi-driver
    nvitop
    vdpauinfo
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    wgpu-utils
  ];

  fonts = {
    fontconfig.enable = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;

    packages = with pkgs; [
      helvetica-neue-lt-std
      iosevka
      nerd-fonts.fira-code
      nerd-fonts.fira-mono

      figtree
    ];
  };

  environment.pathsToLink = [
    "${pkgs.glib}/bin"
  ];

}
