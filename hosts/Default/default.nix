{
  pkgs,
  username,
  home-manager,
  ...
}: {
  imports = [
    ../common.nix
    ../../modules/desktop/hyprland # Enable Hyprland window manager
    ./hardware-configuration.nix
  ];

  # Home-manager config
  home-manager.users.${username} = {
    # THE FOLLOWING OPTIONS ARE SET IN hosts/common.nix

    #home.username = username;
    #home.homeDirectory = "/home/${username}";

    # Let Home Manager install and manage itself.
    #programs.home-manager.enable = true;

    home.stateVersion = "23.11"; # Please read the comment before changing.

    # ADD USER PACKAGES HERE (Add system packages in /system/hosts/Default/configuration.nix)
    home.packages = with pkgs; [
      #vim
      #krita
      #steam
    ];

    home.sessionVariables = {
      # EDITOR = "emacs";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
    ];
    packages = with pkgs; [
      firefox
      kate
      #  thunderbird
    ];
  };

  # ADD SYSTEM PACKAGES HERE (Add user packages in /home/hosts/Default/home.nix )
  environment.systemPackages = with pkgs; [
    # Applications
    #gimp
    #gparted
    #krita
    #lutris
    #mangohud
    #steam
    xfce.thunar

    # Terminal

    # System

    # Development
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
