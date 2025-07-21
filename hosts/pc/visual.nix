{ config, lib, pkgs, system, inputs, ... }:
{
    programs.niri.settings.outputs = {
      "DP-1" = {
        scale = 1.5;
        position = {
          x = 1800;
          y = 300;
        };
      };
      "HDMI-A-1" = {
        scale = 1.25;
        transform = "90";
        position = {
          x = 600;
          y = 100;
        };   
      };   
    };
  
}

