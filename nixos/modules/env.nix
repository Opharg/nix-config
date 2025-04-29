{
  environment = {
    variables = {
      EDITOR = "nvim";

      #NIXOS_OZONE_WL = "1";
    };
    sessionVariables = {
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      LIBVA_DRIVER_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";

    };
  };
}
