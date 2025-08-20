{
  config,
  lib,
  pkgs,
  system,
  inputs,
  ...
}:
{
  home.username = "yui";
  home.homeDirectory = "/home/yui";
  systemd.user = { inherit (config.home) sessionVariables; };

  home.pointerCursor = {
    enable = true;
    package = pkgs.runCommand "makise-kursor" { } ''
      mkdir -p $out/share/icons/makise-kursor
      ${pkgs.unzip}/bin/unzip ${./de/makise-kursor.zip}
      cp -r cursors index.theme $out/share/icons/makise-kursor
    '';
    name = "Makise-Kurisu-Cursor";
    x11.enable = true;
    gtk.enable = true;
  };

  # Imports
  imports = [
    ./packages.nix
    ./graphical
    ./graphical/term.nix
    ./git.nix
    ./cachix.nix
  ];

  # Niri
  programs.niri.package = inputs.niri.packages.${system}.niri-unstable;
  # Zen Browser
  programs.zen-browser = {
    enable = true;
  };
  # Network Manager Applet
  # Xdg Desktop Portal
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

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

  # MUSIC
  home.sessionVariables.WINEFSYNC = "1";



  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
