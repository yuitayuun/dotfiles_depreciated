{ config, lib, pkgs, system, inputs, ... }:
{
    programs.niri.settings.outputs = {
      "DP-1" = {
        mode.width = 2560;
        mode.height = 1440;
        scale = 1.5;
        position = {
          x = 0;
          y = 60;
        };
      };
      "HDMI-A-1" = {
        scale = 1.25;
        transform.rotation = 90;
        position = {
          x = 610;
          y = 0;
        };   
      };   
    };
  
}

