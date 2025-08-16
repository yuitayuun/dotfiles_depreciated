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
    wineasio
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
    browsh
    ncdu
    ripdrag
    alacritty
    nix-search-tv
    nix-index
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
    osu-lazer-bin
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
  services.swaync.enable = true;

}
