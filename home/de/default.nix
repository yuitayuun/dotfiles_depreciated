{ config, lib, pkgs, system, inputs, ... }:
{
#  imports = [ inputs.catppuccin.homeModules.catppuccin ];

 # Niri System Thingies!
  programs.niri.enable = true;
  programs.niri.settings = {
    prefer-no-csd = true;
    environment = {
      CLUTTER_BACKEND = "wayland";
      DISPLAY = ":0";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
     # _JAVA_AWT_WM_NONREPARENTING = "1";
      TERM = "kitty";
      TERMINAL = "kitty";
      XMODIFIERS = "@im=fcitx";
    };
    input = {
      keyboard = {
        xkb.layout = "pl";
        numlock = true;
        repeat-rate = 50;
        repeat-delay = 250;
      };      
      touchpad = {
        natural-scroll = true;
       scroll-method = "two-finger"; 
      };
      focus-follows-mouse = {
        enable = true;
        max-scroll-ammount = 70;
      };
      warp-mouse-to-focus.enable = true;
     #workspace-auto-back-and-forth = true;

    };
     screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";

    # outputs = {
    #   "eDP-1" = {
    #     scale = 1.25;
    #     position = {
    #       x = 2561;
    #       y = 200;
    #     };
    #   };
    #   "HDMI-A-1" = {
    #     scale = 1.5;
    #     position = {
    #       x = 0;
    #       y = 0;
    #     };   
    #   };   
    # };
    layout = {
      focus-ring = {
        width = 2;
        active.gradient = {from="green"; to="purple"; };
        inactive.color = "505050";   
      };
      default-column-width = { };
      gaps = 8;
      preset-column-widths = [
        { proportion = 0.3; }
        { proportion = 0.5; }
        { proportion = 0.7; }
        { proportion = 1.0; }
      ];
      tab-indicator = {
      position = "top";
      place-within-column = true;
      };
      shadow = {
          enable = true;
         #offset = {
        #   x = 0;
        #   y = 0;
        # };
        };
      };
    spawn-at-startup = [
      {
        command = [
          "swaybg"
          "-i"
          "/home/yui/dotfiles/home/de/newbackgroundblur.png"
        ];
      }
      { command = [ "way-edges" ]; }
      { command = [ "swww-daemon" ]; }
      { command = [ "syncthing" "--no-browser" ]; }
      { command = [ "otd-daemon" ]; }
      { command = [ "sh" "-c" "equibop& fractal" ]; }
      { command = [ "xwayland-satellite" ]; }
      {
        command = [
          "wlsunset"
          "-S"
          "7:30"
          "-s"
          "18:00"
          "-t"
          "4500"
          "-d"
          "1800"
        ];
      }
     
    ];        
    
    window-rules = [
      {
        matches = [ { app-id = ".*"; } ];
        clip-to-geometry = true;
        draw-border-with-background = false;
      }
      {
        matches = [ { is-floating = true; } ];
        baba-is-float = true;
      }
    ];
    layer-rules = [
      {
        matches = [ { namespace = "^wallpaper$"; } ];
        place-within-backdrop = true;
      }
      
    ];
    cursor = {
      theme = "makise-kursor";
      hide-when-typing = true;
      size = 24;
    };

    binds =
        with config.lib.niri.actions;
        let
          move-column-to-workspace = n: { move-column-to-workspace = n; };
        in
        {
          "Mod+Shift+Slash".action = show-hotkey-overlay;
        #  "Mod+Return".action.spawn = pkgs.rice.terminal;
        #  "Mod+Space".action.spawn = pkgs.lib.splitString " " pkgs.rice.menu;
        #  "Mod+Backspace".action.spawn = "wlr-which-key";
        #  "Mod+Ctrl+p".action.spawn = "keepmenu";
        #  "Mod+Ctrl+q".action.spawn = [
        #    "loginctl"
        #    "terminate-user"
        #    ""
        #  ];

          Print.action = screenshot;
          "Mod+Shift+S".action = screenshot;
        # "Shift+Print".action.spawn = builtins.toString (
        #    pkgs.writeShellScript "save-replay" "killall -SIGUSR1 gpu-screen-recorder && notify-send -u low 'GPU Screen Recorder' 'Replay saved' -i com.dec05eba.gpu_screen_recorder -a 'GPU Screen Recorder'"
        #  );

          XF86AudioMute = {
            action.spawn = [
              "wpctl"
              "set-mute"
              "@DEFAULT_AUDIO_SINK@"
              "toggle"
            ];
            allow-when-locked = true;
          };
          XF86AudioRaiseVolume = {
            action.spawn = [
              "wpctl"
              "set-volume"
              "-l"
              "1.5"
              "@DEFAULT_AUDIO_SINK@"
              "5%+"
            ];
            allow-when-locked = true;
          };
          XF86AudioLowerVolume = {
            action.spawn = [
              "wpctl"
              "set-volume"
              "@DEFAULT_AUDIO_SINK@"
              "5%-"
            ];
            allow-when-locked = true;
          };
          XF86AudioPlay = {
            action.spawn = [
              "mpc"
              "toggle"
            ];
            allow-when-locked = true;
          };
          XF86AudioPrev = {
            action.spawn = [
              "mpc"
              "prev"
            ];
            allow-when-locked = true;
          };
          XF86AudioNext = {
            action.spawn = [
              "mpc"
              "next"
            ];
            allow-when-locked = true;
          };
          XF86MonBrightnessUp = {
            action.spawn = [
              "brightnessctl"
              "--class=backlight"
              "set"
              "+10%"
            ];
          };
          XF86MonBrightnessDown = {
            action.spawn = [
              "brightnessctl"  
              "--class=backlight"
              "set"
              "10%-"
            ];
          };




          #Spawn Keybinds!
          "Mod+Space".action.spawn = [ "walker" ];
          "Mod+Z".action.spawn = [ "zen-beta" ];
          "Mod+X".action.spawn = [ "swaync-client" "-t" ];
          "Mod+T".action.spawn = [ "kitty" ];
            
          "Mod+Left".action = focus-column-or-monitor-left;
          "Mod+Down".action = focus-window-or-workspace-down;
          "Mod+Up".action = focus-window-or-workspace-up;
          "Mod+Right".action = focus-column-or-monitor-right;

          "Mod+Shift+Left".action =  move-column-left-or-to-monitor-left; 
          "Mod+Shift+Down".action = move-window-down-or-to-workspace-down;
          "Mod+Shift+Up".action = move-window-up-or-to-workspace-up;
          "Mod+Shift+Right".action = move-column-right-or-to-monitor-right;

          "Mod+Ctrl+Left".action =  focus-monitor-left;
          "Mod+Ctrl+Down".action = focus-monitor-down;
          "Mod+Ctrl+Up".action = focus-monitor-up;
          "Mod+Ctrl+Right".action = focus-monitor-right;
          
          "Mod+Shift+Ctrl+Left".action =  move-column-to-monitor-left; 
          "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down; 
          "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up; 
          "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;


          "Mod+Shift+E".action = quit;
          "Mod+Q".action = close-window;
          "Mod+V".action = toggle-window-floating;
          "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;
          "Mod+f".action = maximize-column;
          "Mod+Shift+f".action = fullscreen-window;
          "Mod+Ctrl+f".action = toggle-windowed-fullscreen;
          "Mod+r".action = switch-preset-column-width;
          "Mod+Shift+r".action = expand-column-to-available-width;
          "Mod+Equal".action = set-window-width "+10";
          "Mod+Minus".action = set-window-width "-10";
          "Mod+Shift+Equal".action = set-window-height "+10";
          "Mod+Shift+Minus".action = set-window-height "-10";
          
          "Mod+Alt+Right".action = consume-or-expel-window-right;
          "Mod+Alt+Left".action = consume-or-expel-window-left;
          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;
       #   "Mod+g".action = toggle-column-tabbed-display;
          "Mod+Tab".action = toggle-overview;
        #  "Mod+-".action = [ "set-window-width" "+10%" ];
        #  "Mod++".action = [ "set-window-width" "-10%" ];
          "Mod+WheelScrollDown".action = focus-workspace-down;
          "Mod+WheelScrollUp".action = focus-workspace-up;

          "Mod+1".action = focus-workspace 1;
          "Mod+2".action = focus-workspace 2;
          "Mod+3".action = focus-workspace 3;
          "Mod+4".action = focus-workspace 4;
          "Mod+5".action = focus-workspace 5;
          "Mod+6".action = focus-workspace 6;
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;
          "Mod+Shift+1".action = move-column-to-workspace 1;
          "Mod+Shift+2".action = move-column-to-workspace 2;
          "Mod+Shift+3".action = move-column-to-workspace 3;
          "Mod+Shift+4".action = move-column-to-workspace 4;
          "Mod+Shift+5".action = move-column-to-workspace 5;
          "Mod+Shift+6".action = move-column-to-workspace 6;
          "Mod+Shift+7".action = move-column-to-workspace 7;
          "Mod+Shift+8".action = move-column-to-workspace 8;
          "Mod+Shift+9".action = move-column-to-workspace 9;
        };
      
 };
  


  # Way-Edges!
  programs.way-edges = {
        enable = true;
        settings = {
      "widgets" = [
        {
          "pin-with-key" = false;
          "edge" = "top";
          "position" = "left";
          "monitor" = "*";
          "layer" = "overlay";
          "margins" = {
            "left" = "25%";
          };
          "thickness" = 20;
          "length" = "25%";
          "type" = "btn";
          "color" = "#333";
          "event-map" = {
            "272" = "niri msg action focus-column-left";
            "273" = "niri msg action focus-workspace-up";
          };
        }
        {
          "pin-with-key" = false;
          "edge" = "top";
          "position" = "right";
          "monitor" = "*";
          "layer" = "overlay";
          "margins" = {
            "right" = "25%";
          };
          "thickness" = 20;
          "length" = "25%";
          "type" = "btn";
          "color" = "#333";
          "event-map" = {
            "272" = "niri msg action focus-column-right";
            "273" = "niri msg action focus-workspace-down";
          };
        }
        {
          "pin-with-key" = false;
          "edge" = "bottom";
          "monitor" = "*";
          "layer" = "overlay";
          "thickness" = 20;
          "length" = "40%";
          "type" = "btn";
          "event-map" = {
            "273" = "niri msg action maximize-column";
            "272" = "sh -c pkill nwg-drawer || nwg-drawer";
            "274" = "niri msg action close-window";
            "276" = "niri msg action toggle-column-tabbed-display";
            "275" = "niri msg action toggle-overview";
          };
        }
        ##// =========== workspace ===========
        {
          "edge" = "left";
          "position" = "bottom";
          "layer" = "overlay";
          "monitor" = "eDP-1";
          "type" = "workspace";
          "thickness" = 40;
          "length" = "50%";
          "hover-color" = "#4E884Faa";
          "active-increase" = 0.2;
         # /// "active-color" = "#fff";
          "focus-color" = "#4E884F";
          "default-color" = "#000";
          "focused-only" = true;
          "preset" = { "type" = "niri"; "filter-empty" = false; };
        }
        {
          "edge" = "right";
          "position" = "bottom";
          "layer" = "overlay";
          "monitor" = "HDMI-A-1";
          "type" = "workspace";
          "thickness" = 40;
          "length" = "50%";
          "hover-color" = "#4E884Faa";
          "active-increase" = 0.2;
         # /// "active-color" = "#fff";
          "focus-color" = "#4E884F";
          "default-color" = "#000";
          "focused-only" = true;
          "preset" = { "type" = "niri"; "filter-empty" = false; };
        }
       # // =========== ring stats ===========
        {
          "namespace" = "stats";
          "edge" = "left";
          "position" = "top";
          "margins" = {
            "top" = 40;
          };
          "monitor" = "*";
          "layer" = "overlay";
          "type" = "wrap-box";
          "outlook" = {
            "type" = "window";
            "color" = "#5F215F";
          };
          "items" = [
            {
             # // "radius" = 18;
             # // "ring-width" = 8;
              "font-size" = 20;
              "font-family" = "JetBrainsMono Nerd Font";
              "fg-color" = "#82B2E3";
              "bg-color" = "#00000044";
              "type" = "ring";
              "prefix" = " ";
              "suffix" = " {preset}";
              "suffix-hide" = true;
              "preset" = {
                "update-interval" = 500;
                "type" = "disk";
              };
            }
            {
             # // "radius" = 18;
             # // "ring-width" = 8;
              "font-size" = 20;
              "font-family" = "JetBrainsMono Nerd Font";
              "fg-color" = "#FFB77B";
              "bg-color" = "#00000044";
              "type" = "ring";
              "prefix" = " ";
              "suffix" = " {preset}";
              "suffix-hide" = true;
              "preset" = {
                "update-interval" = 500;
                "type" = "battery";
              };
            }
            {
             # // "radius" = 18;
             # // "ring-width" = 8;
              "font-size" = 20;
              "font-family" = "JetBrainsMono Nerd Font";
              "fg-color" = "#FB8893";
              "bg-color" = "#00000044";
              "type" = "ring";
              "prefix" = " ";
              "suffix" = " {preset}";
              "suffix-hide" = true;
              "preset" = {
                "update-interval" = 500;
                "type" = "cpu";
              };
            }
            {
             # // "radius" = 18;
             # // "ring-width" = 8;
              "font-size" = 20;
              "font-family" = "JetBrainsMono Nerd Font";
              "fg-color" = "#BEAFD9";
              "bg-color" = "#00000044";
              "type" = "ring";
              "prefix" = "󰾶 ";
              "suffix" = " {preset}";
              "suffix-hide" = true;
              "preset" = {
                "update-interval" = 500;
                "type" = "swap";
              };
            }
            {
             # // "radius" = 18;
             # // "ring-width" = 8;
              "font-size" = 20;
              "font-family" = "JetBrainsMono Nerd Font";
              "bg-color" = "#00000044";
              "type" = "ring";
              "prefix" = " ";
              "suffix" = " {preset}";
              "suffix-hide" = true;
              "preset" = {
                "update-interval" = 500;
                "type" = "ram";
              };
            }
          ];
        }
       # // =========== time ===========
        {
          "namespace" = "time";
          "edge" = "top";
          "position" = "right";
          "monitor" = "*";
          "layer" = "overlay";
          "type" = "wrap-box";
          "outlook" = {
            "type" = "window";
            "color" = "#222";
            "margins" = {
              "top" = 10;
              "left" = 30;
              "right" = 30;
              "bottom" = 10;
            };
          };
          "items" = [
            {
              "type" = "text";
              "fg-color" = "#FFFFFF";
              "font-size" = 30;
              "font-family" = "serif";
              "preset" = {
                "type" = "time";
                "update-interval" = 500;
                "format" = "%v %T %A";
              };
            }
          ];
        }
       # // =========== battery indicator ===========
        {
          "edge" = "right";
          "position" = "bottom";
          "margins" = {
            "bottom" = "2%";
          };
          "monitor" = "eDP-1";
          "layer" = "overlay";
          "pin-on-startup" = true;
          "type" = "slider";
          "thickness" = 10;
          "border-width" = 1;
          "length" = "12.5%";
          "fg-color" = "#FF8700cc";
          "bg-color" = "#0000";
          "border-color" = "#FF8700";
          "fg-text-color" = "#0000";# // hide text
          "bg-text-color" = "#0000";
          "redraw-only-on-internal-update" = true;
          "preset" = {
            "type" = "custom";
            "update-interval" = 1000;
            "update-command" = "/home/yui/.config/way-edges/battery.sh";
          };
        }
        {
          "edge" = "right";
          "position" = "top";
          "margins" = {
            "top" = "5%";
          };
          "monitor" = "HDMI-A-1";
          "layer" = "overlay";
          "pin-on-startup" = true;
          "type" = "slider";
          "thickness" = 10;
          "border-width" = 1;
          "length" = "12.5%";
          "fg-color" = "#FF8700cc";
          "bg-color" = "#0000";
          "border-color" = "#FF8700";
          "fg-text-color" = "#0000";# // hide text
          "bg-text-color" = "#0000";
          "redraw-only-on-internal-update" = true;
          "preset" = {
            "type" = "custom";
            "update-interval" = 1000;
            "update-command" = "/home/yui/.config/way-edges/battery.sh";
          };
        }
       # // =========== audio ===========
        {
          "edge" = "top";
          "monitor" = "*";
          "layer" = "overlay";
          "position" = "left";
          "preview-size" = 9;
          "type" = "slider";
          "thickness" = 40;
          "border-width" = 3;
          "length" = "12.5%";
          "radius" = 10;
          "obtuse-angle" = 90;
          "fg-color" = "#18A558cc";
          "bg-color" = "#0000";
          "border-color" = "#18A558";
          "fg-text-color" = "#fffa";
          "bg-text-color" = "#fffa";
          "redraw-only-on-internal-update" = true;
          "preset" = {
            "type" = "speaker";
          };
        }
        {
          "edge" = "top";
          "monitor" = "*";
          "position" = "left";
          "layer" = "overlay";
          "margins" = {
            "left" = "12.5%";
          };
          "preview-size" = 9;
          "type" = "slider";
          "thickness" = 40;
          "border-width" = 3;
          "length" = "12.5%";
          "radius" = 10;
          "obtuse-angle" = 90;
          "fg-color" = "#BD93F9cc";
          "bg-color" = "#0000";
          "border-color" = "#BD93F9";
          "fg-text-color" = "#fffa";
          "bg-text-color" = "#fffa";
          "redraw-only-on-internal-update" = true;
          "preset" = {
            "type" = "microphone";
          };
        }
       # // =========== tray ===========
        {
          "namespace" = "tray";
          "edge" = "bottom";
          "position" = "left";
          "monitor" = "HDMI-A-1";
          "layer" = "overlay";
          "type" = "wrap-box";
          "align" = "bottom-left";
          "outlook" = {
            "type" = "window";
            "color" = "#0C986C";
          };
          "items" = [
            {
              "font-family" = "sans-serif";
              "type" = "tray";
              "icon-size" = 40;
              "header-menu-stack" = "menu-top";
              "header-menu-align" = "left";
              "menu-draw-config" = {
                "font-pixel-height" = 18;
                "text-color" = "#eee";
                "border-color" = "#111";
              };
              "header-draw-config" = {
                "text-color" = "#eee";
              };
              "grid-align" = "bottom-left";
            }
          ];
        }
        {
          "namespace" = "tray";
          "edge" = "bottom";
          "position" = "right";
          "monitor" = "eDP-1";
          "layer" = "overlay";
          "type" = "wrap-box";
          "align" = "bottom-left";
          "outlook" = {
            "type" = "window";
            "color" = "#0C986C";
          };
          "items" = [
            {
              "font-family" = "sans-serif";
              "type" = "tray";
              "icon-size" = 40;
              "header-menu-stack" = "menu-top";
              "header-menu-align" = "left";
              "menu-draw-config" = {
                "font-pixel-height" = 18;
                "text-color" = "#eee";
                "border-color" = "#111";
              };
              "header-draw-config" = {
                "text-color" = "#eee";
              };
              "grid-align" = "bottom-left";
            }
          ];
        }
      ];
    };
   };  

  
  home.file.".config/way-edges/battery.sh".source = ./battery.sh;



  # GTK Theme!
  gtk.enable = true;
  catppuccin = {
    enable = true;
    gtk = {
      enable = true;
      flavor = "mocha";
      accent = "lavender";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };


  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme.override {color = "magenta"; };
    name = "Papirus";
  };
}
