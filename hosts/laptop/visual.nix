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

  programs.way-edges.settings."widgets" = [
    {
      "edge" = "left";
      "position" = "top";
      "monitor" = "eDP-1";
      "layer" = "overlay";
      "margins" = {
        "top" = "20%";
      };
      "thickness" = 40;
      "length" = "25%";
      "fg-color" = "#85C9E8cc";
      "bg-color" = "#0000";
      "border-color" = "#85C9E8ff";
      "fg-text-color" = "#fffa";
      "bg-text-color" = "#fffa";
      "radius" = 10;
      "obtuse-angle" = 90;
      "type" = "slider";
      "preset" = {
        "type" = "backlight";
      };
    }
    {
      "edge" = "right";
      "position" = "top";
      "monitor" = "HDMI-A-1";
      "layer" = "overlay";
      "margins" = {
        "top" = "20%";
      };
      "thickness" = 40;
      "length" = "25%";
      "fg-color" = "#85C9E8cc";
      "bg-color" = "#0000";
      "border-color" = "#85C9E8ff";
      "fg-text-color" = "#fffa";
      "bg-text-color" = "#fffa";
      "radius" = 10;
      "obtuse-angle" = 90;
      "type" = "slider";
      "preset" = {
        "type" = "backlight";
      };
    }
  ]; 
}
