{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    musnix.url = "github:/musnix/musnix";
    eza = {
      url = "github:eza-community/eza";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    bunny-yazi = {
      url = "github:stelcodes/bunny.yazi";
      flake = false;
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    way-edges.url = "github:way-edges/way-edges";
    catppuccin.url = "github:catppuccin/nix";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nur-bandithedoge.url = "github:bandithedoge/nur-packages";
    # home-manager for user configs
    home-manager = {
      url = "github:nix-community/home-manager/";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      catppuccin,
      ...
    }@inputs:
    {
      # Please replace my-nixos with your hostname
      nixosConfigurations = {

        tayuun = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          system = "x86_64-linux";
          modules = [
            # Import the previous configuration.nix we used,
            # so the old configuration file still takes effect
            ./hosts/laptop/configuration.nix
            ./home/cachix.nix
            catppuccin.nixosModules.catppuccin
            inputs.home-manager.nixosModules.home-manager            
            inputs.musnix.nixosModules.musnix
            (
              { config, ... }:
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
                  inherit inputs;
                  system = config.nixpkgs.hostPlatform.system;
                };
                home-manager.users.yui = import ./home;
                nixpkgs.overlays = with inputs; [
                  inputs.nix-alien.overlays.default
                  (final: prev: {
                    zen-browser = inputs.zen-browser.packages.${prev.system}.default;
                  })
                (_: prev: {
                  bandithedoge = nur-bandithedoge.legacyPackages.${prev.system}
                ;})
                ];
              }
            )
            {
              home-manager.users.yui.imports = [
                inputs.niri.homeModules.niri
                catppuccin.homeModules.catppuccin
                inputs.zen-browser.homeModules.default
                inputs.way-edges.homeManagerModules.default
              ];
            }
            {
              users.users.root = {
                # normal root user config if any
              };

              # Add root home-manager config here:
              home-manager.users.root = {
                home.stateVersion = "25.11"; # <<< Add this
                programs.helix = {
                  enable = true;
                  settings = {
                    theme = nixpkgs.lib.mkForce "ayu_transparent";
                    editor.scroll-lines = 7;
                    editor.soft-wrap.enable = true;
                    editor.lsp.display-inlay-hints = true;
                    editor.auto-format = true;
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
                };

                home.file.".config/helix/themes/ayu_transparent.toml".source = ./home/de/ayu_transparent.toml;

              };
            }
          ];
        };

        pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            # Import the previous configuration.nix we used,
            # so the old configuration file still takes effect
            ./hosts/pc/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.yui = import ./home;
              nixpkgs.overlays = with inputs; [
                nix-alien.overlays.default
                (final: prev: {
                  zen-browser = zen-browser.packages.${prev.system}.default;
                })
              ];
            }
            {
              home-manager.users.yui.imports = [
                inputs.niri.homeModules.niri
                catppuccin.homeModules.catppuccin
                inputs.zen-browser.homeModules.default
                inputs.way-edges.homeManagerModules.default
              ];
            }
            {
              users.users.root = {
                # normal root user config if any
              };

              # Add root home-manager config here:
              home-manager.users.root = {
                home.stateVersion = "25.11"; # <<< Add this
                programs.helix = {
                  enable = true;
                  settings = {
                    theme = nixpkgs.lib.mkForce "ayu_transparent";
                    editor.scroll-lines = 7;
                    editor.soft-wrap.enable = true;
                    editor.lsp.display-inlay-hints = true;
                    editor.auto-format = true;
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
                };

                home.file.".config/helix/themes/ayu_transparent.toml".source = ./home/de/ayu_transparent.toml;

              };
            }
          ];
        };

      };
    };
}
