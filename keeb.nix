{ inputs, config, pkgs, ... }:
{

  # Fcitx5
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-configtool
      fcitx5-gtk
      catppuccin-fcitx5
     ];
  };
  i18n.inputMethod.fcitx5.waylandFrontend = true;
  
    # Optional: set keyboard layout in X11/Wayland
  services.xserver = {
    enable = true;
    xkb.layout = "pl";
    xkb.variant = "";
  };
  # Configure console keymap
  console.keyMap = "pl2";

  services.kanata = {
    # {{{
    enable = true;
    keyboards.internal = {
      devices = ["/dev/input/by-path/platform-i8042-serio-0-event-kbd"];
      config = builtins.readFile ./kmonad.kbd;
    };
  };
}
