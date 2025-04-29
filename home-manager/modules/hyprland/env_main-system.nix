{
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        # NVIDIA https://wiki.hyprland.org/Nvidia/
        "GBM_BACKEND,nvidia-drm"
        "LIBVA_DRIVER_NAME,nvidia"
        "SDL_VIDEODRIVER,wayland"
        "WLR_DRM_NO_ATOMIC,1"
        "__GL_GSYNC_ALLOWED, 1"
        "__GL_VRR_ALLOWED,1"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "__NV_PRIME_RENDER_OFFLOAD,1"
        "__VK_LAYER_NV_optimus,NVIDIA_only"
        #"__GL_SYNC_TO_VBLANK,0"

        # FOR VM and POSSIBLY NVIDIA
        "WLR_NO_HARDWARE_CURSORS,1" # On hyprland >v0.41, now configured on variable cursor section
        "WLR_RENDERER_ALLOW_SOFTWARE,1"

        # nvidia firefox (for hardware acceleration on FF)?
        # check this post https://github.com/elFarto/nvidia-vaapi-driver#configuration
        "MOZ_DISABLE_RDD_SANDBOX,1"
        "MOZ_ENABLE_WAYLAND,1"
        "EGL_PLATFORM,wayland"

        # VA-API hardware video acceleration
        "NVD_BACKEND,direct"

        # XDG Desktop Portal
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        # QT
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"

        # GDK
        "env = GDK_SCALE,1"

        # Toolkit Backend
        "GDK_BACKEND,wayland,x11,*"
        "CLUTTER_BACKEND,wayland"

        # Set the cursor size for xcursor
        "XCURSOR_SIZE,24"

        # Disable appimage launcher by default
        "APPIMAGELAUNCHER_DISABLE,1"

        # Ozone
        #"OZONE_PLATFORM,wayland"
        #"ELECTRON_OZONE_PLATFORM_HINT,wayland"
      ];

      cursor = {
        no_hardware_cursors = true;
      };
    };
  };
}
