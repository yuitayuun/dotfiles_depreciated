{ config, lib, pkgs, system, inputs, ... }:
{
  home.username = "yui";
  home.homeDirectory = "/home/yui";
  systemd.user = {inherit (config.home) sessionVariables;};
  home.packages = with pkgs; [
    # Communicators
    dorion
    equibop
    fractal
    chromium
    # Looks
    swww
    magnetic-catppuccin-gtk
    swaybg
    # Work
    obsidian
    onlyoffice-bin_latest
    jetbrains.pycharm-professional
    anki-bin
     # Tools
    alacritty
    nix-search-tv
    unrar
    isoimagewriter
    cider
    yt-dlp
    flitter
    nemo
    brightnessctl
    gparted
    jq
    fastfetch
    wlsunset
    bitwarden
    hyprpicker
    htop
    gpu-screen-recorder
    gpu-screen-recorder-gtk    
    rustdesk-flutter
    pwvucontrol
     # Compatibility        
    nix-alien
    bottles
    wine    
    qemu
    quickemu
     # Gaming
    lutris
    gamescope            
    ppsspp-sdl-wayland
    xivlauncher
    heroic
    
    # (zen-browser.override {
    #   extraPrefsFiles = [
    #     (builtins.fetchurl {  
    #       url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/program/config.js";
    #       sha256 = "1mx679fbc4d9x4bnqajqx5a95y1lfasvf90pbqkh9sm3ch945p40";
    #     })
    #   ];
    # })
  ];


  programs.niri.package = inputs.niri.packages.${system}.niri-unstable;


  home.pointerCursor = {
    enable = true;
    package = pkgs.runCommand "makise-kursor" {} ''
      mkdir -p $out/share/icons/makise-kursor
      ${pkgs.unzip}/bin/unzip ${../makise-kursor.zip}
      cp -r cursors index.theme $out/share/icons/makise-kursor
    '';
    name = "Makise-Kurisu-Cursor";
    x11.enable = true;
    gtk.enable = true;
  };

    
  # Imports
  imports = [
    ./de
    ./de/term.nix
    ./git.nix
    ./cachix.nix
  ];


  # services.swayidle = {
  #   enable = true;
  #   timeouts = [
  #     {
  #       timeout = 240;
  #       command = "${pkgs.systemd}/bin/loginctl lock-session";
  #     }
  #     {
  #       timeout = 420;
  #       command = "${pkgs.systemd}/bin/systemctl sleep";
  #     }
  #   ];
  #   events = [
  #     {
  #       event = "lock";
  #       command = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --indicator --clock --effect-blur 10x3 --layout-bg-color FFFFFF --ring-color 4B0076 --key-hl-color 000000 --text-color FF13F0 --inside-ver-color FF13F0 --text-ver-color 000000 --ring-ver-color 000000 &";
  #     }
  #     {
  #       event = "before-sleep";
  #       command = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --indicator --clock --effect-blur 10x3 --layout-bg-color FFFFFF --ring-color 4B0076 --key-hl-color 000000 --text-color FF13F0 --inside-ver-color FF13F0 --text-ver-color 000000 --ring-ver-color 000000 &";
  #     }
  #   ];
  # };
    


  # Zen Browser
  programs.zen-browser = {
    enable = true;
  }; 
  # Network Manager Applet
  # Xdg Desktop Portal
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  
  # gpu-screen-recorder
 # programs.gpu-screen-recorder.enable = true;
  
 # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11"; 


  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}

