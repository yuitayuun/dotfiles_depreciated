{
  config,
  lib,
  pkgs,
  system,
  inputs,
  ...
}:

{
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
    logseq
    obsidian
    onlyoffice-bin_latest
    jetbrains.pycharm-professional
    anki-bin
    # Tools
    via
    bat
    mpv
    overskride
    walker
    nwg-look
    alacritty
    unrar
    isoimagewriter
    cider
    yt-dlp
    flitter
    nemo
    brightnessctl
    gparted
    jq
    wlsunset
    bitwarden
    hyprpicker
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    rustdesk-flutter
    # Tools (but cooler cuz in terminal)
    pokemon-colorscripts-mac
    ripdrag
    browsh
    ncdu
    fastfetch
    htop
    
    # Compatibility
    wineWowPackages.yabridge
    nix-alien
    bottles
    winetricks
    qemu
    quickemu
    # Gaming
    osu-lazer-bin
    lutris
    gamescope
    ppsspp-sdl-wayland
    xivlauncher
    heroic
    # Nix!
    nixd
    nixfmt-rfc-style
    nix-search-tv
    nix-index
    # Music and Audio!
    bandithedoge.aida-x
    yabridge
    yabridgectl
    wineasio
    pwvucontrol
    pavucontrol
    # (zen-browser.override {
    #   extraPrefsFiles = [
    #     (builtins.fetchurl {
    #       url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/program/config.js";
    #       sha256 = "1mx679fbc4d9x4bnqajqx5a95y1lfasvf90pbqkh9sm3ch945p40";
    #     })
    #   ];
    # })
  ];
  services.swaync.enable = true;

}
