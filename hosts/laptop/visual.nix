{ config, lib, pkgs, system, inputs, ... }:
{
    programs.niri.settings.outputs = {
      "eDP-1" = {
        scale = 1.25;
        position = {
          x = 2561;
          y = 200;
        };
      };
      "HDMI-A-1" = {
        scale = 1.5;
        position = {
          x = 0;
          y = 0;
        };   
      };   
    };

}
