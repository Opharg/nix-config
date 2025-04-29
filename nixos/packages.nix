{ pkgs, inputs, ... }:
let
  figtree = pkgs.callPackage ./modules/figtree/default.nix { };
in
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "python-2.7.18.8"
      "electron-25.9.0"
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

  environment.systemPackages = with pkgs; [
    # Desktop apps
    calibre
    discord
    firefox
    inputs.zen-browser.packages."${system}".default
    kitty
    krita
    mpv
    obs-studio
    #pavucontrol
    pwvucontrol
    spotify
    spotifywm
    yazi

    # Gaming
    # gamemode
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
    nvim-pkg # idk, doesn't work
    vscode

    # Wayland
    rofi-wayland
    wl-clipboard

    # Styling
    bibata-cursors
    glib
    gnome-themes-extra
    papirus-icon-theme

    # WM
    brightnessctl
    dmenu
    hyprland
    hyprlock
    hyprpaper
    libnotify
    rofi-wayland
    swaynotificationcenter
    waybar
    waypaper
    wlogout

    # Other
    gnome-keyring
    home-manager
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

  fonts.packages = with pkgs; [
    helvetica-neue-lt-std
    iosevka
    nerd-fonts.fira-code
    nerd-fonts.fira-mono

    figtree
  ];

  environment.pathsToLink = [
    "${pkgs.glib}/bin"
  ];

}
