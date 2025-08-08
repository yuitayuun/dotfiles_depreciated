{
  pkgs,
  config,
  inputs,
  ...
}:
{
  home.sessionVariables.BROWSER = "librewolf";

  programs = {
    librewolf = {
      # {{{
      enable = true;
      languagePacks = [
        "en-US"
        "pl"
      ];
      profiles = {
        default = {
          extensions = {
            force = true;
          };
          name = "default";
          id = 0;
      settings = {
            "browser.autofocus" = false;
            "devtools.chrome.enabled" = true;
            "devtools.debugger.remote-enabled" = true;
            "dom.security.https_only_mode" = true;
            "extensions.webextensions.ExtensionStorageIDB.enabled" = false;
            "general.autoScroll" = true;
            "layers.acceleration.force-enabled" = true;
            "sidebar.revamp" = true;
            "sidebar.verticalTabs" = true;
            "sidebar.visibility" = "expand-on-hover";
            "toolkit.tabbox.switchByScrolling" = true;
            "ui.context_menus.after_mouseup" = true;
            "ui.key.menuAccessKeyFocuses" = false;

            "identity.fxaccounts.enabled" = true;
            "privacy.clearOnShutdown.cookies" = false;
            "privacy.clearOnShutdown.downloads" = false;
            "privacy.clearOnShutdown.history" = false;
            "privacy.fingerprintingProtection" = false;
            # "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
            "privacy.resistFingerprinting" = false;
            "webgl.disabled" = false;

            # smoothfox
            "apz.overscroll.enabled" = true;
            "general.smoothScroll" = true;
            "general.smoothScroll.currentVelocityWeighting" = "0.15";
            "general.smoothScroll.mouseWheel.durationMinMS" = 80;
            "general.smoothScroll.stopDecelerationWeighting" = "0.6";
            "mousewheel.min_line_scroll_amount" = 10;

            # https://github.com/black7375/Firefox-UI-Fix/blob/master/user.js
            "browser.compactmode.show" = true;
            "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
            "layout.css.has-selector.enabled" = true;
            "svg.context-properties.content.enabled" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

            # https://github.com/black7375/Firefox-UI-Fix/wiki/Options
            "userChrome.autohide.bookmarkbar" = true;
            "userChrome.autohide.page_action" = true;
            "userChrome.autohide.navbar" = false; #test
            "userChrome.centered.urlbar" = true;
            "userChrome.decoration.animate" = true;
            "userChrome.decoration.cursor" = true;
            "userChrome.decoration.download_panel" = true;
            "userChrome.decoration.field_border" = true;
            "userChrome.panel.remove_strip" = true;
            "userChrome.theme.built_in_contrast" = true;
            "userChrome.theme.fully_color" = true;
            "userChrome.theme.fully_dark" = true;
            "userChrome.theme.proton_chrome" = true;
            "userChrome.theme.proton_color" = true;
            "userChrome.urlView.go_button_when_typing" = true;
            "userChrome.urlView.move_icon_to_left" = true;
            "userContent.newTab.field_border" = true;
            "userContent.page.dark_mode" = true;
            "userContent.page.illustration" = true;
            "userContent.page.proton" = true;
            "userContent.page.proton_color" = true;
            "userContent.player.animate" = true;
            "userContent.player.click_to_play" = true;
            "userContent.player.icon" = true;
            "userContent.player.noaudio" = true;
            "userContent.player.size" = true;
            "userContent.player.ui" = true;
          };
          preConfig = builtins.readFile (inputs.betterfox + "/user.js");
          userChrome = ''
            @import url("${inputs.firefox-ui-fix + "/css/leptonChrome.css"}");
          '';
          userContent = ''
            @import url("${inputs.firefox-ui-fix + "/css/leptonContent.css"}")
          '';
        };
        secondary = {
        id = 1;
        extensions.force = true;
        };
      };
    }; # }}}
};


}
