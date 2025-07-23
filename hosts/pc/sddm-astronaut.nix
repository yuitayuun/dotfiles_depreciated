
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: 

{
  stdenvNoCC,
  qt6,
  lib,
  fetchFromGitHub,
  formats,
  theme ? "astronaut",
  themeConfig ? null,
}: let
  overwriteConfig = (formats.ini {}).generate "${theme}.conf.user" themeConfig;
in
  stdenvNoCC.mkDerivation rec {
    name = "sddm-astronaut-theme";

    src = fetchFromGitHub {
      owner = "Keyitdev";
      repo = "sddm-astronaut-theme";
      rev = "3ef9f511fd072ff3dbb6eb3c1c499a71f338967e";
      hash = "sha256-33CzZ4vK1dicVzICbudk8gSRC/MExG+WnrE9wIWET14=";
    };

    propagatedUserEnvPkgs = with qt6; [qtsvg qtvirtualkeyboard qtmultimedia];

    dontBuild = true;

    dontWrapQtApps = true;

    installPhase = ''
      themeDir="$out/share/sddm/themes/${name}"

      mkdir -p $themeDir
      cp -r $src/* $themeDir

      install -dm755 "$out/share/fonts"
      cp -r $themeDir/Fonts/* $out/share/fonts/

      # Update metadata.desktop to load the chosen theme.
      substituteInPlace "$themeDir/metadata.desktop" \
        --replace-fail "ConfigFile=Themes/astronaut.conf" "ConfigFile=Themes/${theme}.conf"

      # Create theme.conf.user of the selected theme. To overwrite its configuration.
      ${lib.optionalString (lib.isAttrs themeConfig) ''
        install -dm755 "$themeDir/Themes"
        cp ${overwriteConfig} $themeDir/Themes/${theme}.conf.user
      ''}
    '';

    meta = with lib; {
      description = "Series of modern looking themes for SDDM";
      homepage = "https://github.com/Keyitdev/sddm-astronaut-theme";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };

  config = lib.mkIf (config.de == "plasma") {
    environment.systemPackages = [
      # sddm related
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtvirtualkeyboard
      (pkgs.callPackage ../../../derivs/sddm-astronaut-theme.nix {
        theme = "japanese_aesthetic";
      })

      # cosmetic
      pkgs.kde-rounded-corners
      inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
    ];

    services = {
      xserver.enable = false;
      desktopManager.plasma6.enable = true;

      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "sddm-astronaut-theme";
      };
    };
  };


}

