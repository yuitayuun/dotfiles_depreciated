{
  lib,
  inputs,
  config,
  pkgs,
  ...
}:

{

  #enable flakes and nix-command
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.systemPackages = with pkgs; [
    walker
    pokemon-colorscripts-mac
    zoxide
    nwg-look
    nixd
    nixfmt-rfc-style
    nh
    opentabletdriver
    swaylock-effects
    syncthing
    mpv
    overskride
    blueman
    kanata
    evtest
    usbutils
    bat
    gparted
    via
    vial
    qmk-udev-rules

    # catppuccin-gtk
    # magnetic-catppuccin-gtk
    #nautilus
    #gnome-disk-utility
    # more packages go here
  ];

  # Network Manager Applet
  programs.nm-applet.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    xwayland-satellite
  ];

  #set default editor as helix
  environment.variables.EDITOR = "hx";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tayuun"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = false;
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
  };
  catppuccin = {
    sddm = {
      enable = true;
    };
    fcitx5 = {
      enable = true;
    };
    tty = {
      enable = true;
    };
  };

  environment.gnome.excludePackages = [ pkgs.gnome-console ];
  services.desktopManager.gnome.enable = true;
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
  # Set niri as a default session
  services.displayManager.defaultSession = "niri";
  # Niri Latest Commit
  programs.niri.package = inputs.niri.packages.${config.nixpkgs.hostPlatform.system}.niri-unstable;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Shell options!
  users.users.yui.shell = pkgs.fish;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yui = {
    isNormalUser = true;
    description = "yui";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Install fish.
  programs.fish = {
    enable = true;
  };
  # Install firefox.
  programs.firefox.enable = true;
  # Install niri.
  programs.niri.enable = true;
  # Soteria polkit agent.
  security.soteria.enable = true;
  # Steam!
  programs.steam.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  systemd.user.services."xdg-desktop-portal-gnome".path = [ pkgs.nautilus ];
  systemd.user.services.niri-polkit-gnome = {
    wantedBy = [ "niri.service" ];
    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # Enables Syncthing as a service
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  #overwriting files so nh doesnt tweak out
  home-manager.backupFileExtension = "backup";

}
