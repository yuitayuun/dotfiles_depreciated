{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{

  # Yazi!
  programs.yazi = {
    enable = true;

    settings = {
      mgr = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };

      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
      };
    };
    plugins = with pkgs.yaziPlugins; {
      inherit mount;
      bunny = "${inputs.bunny-yazi}";
    };
    keymap.mgr.prepend_keymap = [
      {
        on = "M";
        run = "plugin mount";
      }
      {
        on = "<C-n>";
        run = "shell -- ripdrag -n \"$@\"";
        desc = "Drag and drop";
      }
      {
        on = ";";
        run = "plugin bunny";
        desc = "Start bunny.yazi";
      }
    ];
    initLua = ''
        require("bunny"):setup({
        hops = {
          { key = "/",          path = "/",                                                   },
          { key = "t",          path = "/tmp",                                                },
          { key = "n",          path = "~/dotfiles",       desc = "doftiles!"                 },
          { key = "h",          path = "~",                desc = "Home"                      },
          { key = "m",          path = "~/Music",          desc = "Music"                     },
          { key = "v",          path = "~/Videos",          desc = "Videos"                   },
          { key = "d",          path = "~/Desktop",        desc = "Desktop"                   },
          { key = "D",          path = "~/Documents",      desc = "Documents"                 },
          { key = "c",          path = "~/.config",        desc = "Config files"              },
          { key = { "l", "s" }, path = "~/.local/share",   desc = "Local share"               },
          { key = { "l", "b" }, path = "~/.local/bin",     desc = "Local bin"                 },
          { key = { "l", "t" }, path = "~/.local/state",   desc = "Local state"               },
          { key = "s",          path = "~/.local/share/Steam/steamapps/common", desc = "Steam"},
          -- key and path attributes are required, desc is optional
        },
        desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
        ephemeral = true, -- Enable ephemeral hops, default is true
        tabs = true, -- Enable tab hops, default is true
        notify = false, -- Notify after hopping, default is false
        fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
      })'';
  };

  # home.file.".config/yazi/init.lua.source" = ./yaziinit.lua;

  # Kitty!
  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ./kitty-colors.conf
    '';
    settings = {
      # Fonts
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 11;
      disable_ligatures = true; # Prevents spacing glitches
      #??? symbol_map  U+60c-U+6cc,U+fb56-U+fefc Vazir Code Hack

      # Window
      window_padding_width = "10";
      background_opacity = "0.8";
      dynamic_background_opacity = true;
      cursor_trail = "1";
      # Tabs
      tab_bar_style = "fade";
      tab_fade = 1;
      active_tab_font_style = "bold";
      inactive_tab_font_style = "bold";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkForce "ayu_transparent";

      editor = {
        scroll-lines = 7;
        soft-wrap = {
          enable = true;
        };
        lsp = {
          display-inlay-hints = true;
        };
        auto-format = true;
      };
    };

    languages = {
      language-server = {
        nixd.command = "nixd";
        nil.command = "nil";
      };

      languages = [
        {
          name = "nix";
          language-servers = [
            "nixd"
            "nil"
          ];
        }
      ];
    };
    themes = {
      ayu_transparent = {
        "inherits" = "ayu_evolve";
        "ui.background" = { };
      };
    };
  };

  # Fish!
  programs.fish = {
    enable = true;
    shellInit = ''
      if test -f ~/.config/user-dirs.dirs
        sed '/^#/d;s/^/set -x /;s/=/ /' ~/.config/user-dirs.dirs | source
      end

      set -x QT_IM_MODULE fcitx
      set -x XMODIFIERS @im=fcitx
      set -x SDL_IM_MODULE fcitx
      set -x GLFW_IM_MODULE ibus
    '';
    interactiveShellInit = ''
      ${pkgs.zoxide}/bin/zoxide init fish | source
    '';
  };

  home.shellAliases = {
    bt = "overskride";
    runat = "systemd-run --user --on-calendar";
    runafter = "systemd-run --user --on-active";
    webcam = "mpv --vf=hflip --profile=low-latency --untimed av://v4l2:/dev/video0";
    nmcon = "nmcli device wifi connect";
    nmre = "nmcli device wifi rescan";
    niriconf = "hx /home/yui/.config/niri/config.kdl";
    ctt = "exec /home/yuitayuun/Downloads/ClickTap.UX-linux-x64/ClickTap.UX.Desktop";
    
    ",s" = "nh os switch ~/dotfiles";
    ",u" = "nh os switch ~/dotfiles --update";
    ",h" = "hx ~/dotfiles/home/default.nix";
    ",hp" = "hx ~/dotfiles/home/packages.nix";
    ",lc" = "hx ~/dotfiles/hosts/laptop/configuration.nix";
    ",lh" = "hx ~/dotfiles/hosts/laptop/home/default.nix";
    ",pc" = "hx ~/dotfiles/hosts/pc/configuration.nix";
    ",ph" = "hx ~/dotfiles/hosts/pc/home/default.nix";
    ",c" = "hx ~/dotfiles/nixos/default.nix";

    ",f" = "hx ~/dotfiles/flake.nix";
    ",d" = "hx ~/dotfiles/home/de/default.nix";
    ",t" = "hx ~/dotfiles/home/de/term.nix";
    ",n" = "yazi ~/dotfiles";
    ",ss" = "sudo nixos-rebuild switch --flake ~/dotfiles";
    ",k" = "hx ~/dotfiles/keeb.nix";
    ",g" = "lazygit -p ~/dotfiles";
    "garbage" = "nix-collect-garbage -d";
    "we" = "pkill -f way-edges; way-edges";
  };

  # Point to the external theme file
  home.file.".config/kitty/kitty-colors.conf".source = ./kitty-colors.conf;

}
