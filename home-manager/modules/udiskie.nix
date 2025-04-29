{
  services.udiskie = {
    enable = true;

    notify = true;
    tray = "auto";

    settings = {
      automount = true;
      mountpoint = "/media/usb";
      filesystem = "auto";

      notifications = {
        device_mounted = -1;
        device_unmounted = -1;
        device_added = -1;
        device_removed = -1;
        device_unlocked = -1;
        device_locked = -1;
        job_failed = -1;
      };
    };

  };
}
