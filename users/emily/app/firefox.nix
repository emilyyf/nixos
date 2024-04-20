{
  config,
  pkgs,
  inputs,
  age,
  systemSettings,
  ...
}: {
  programs.firefox = {
    enable = true;
    package =
      if systemSettings.system == "x86_64-darwin"
      then null
      else pkgs.firefox;
    profiles = {
      main = {
        name = "main";
        id = 0;

        search = {
          default = "DuckDuckGo";
          engines = {
            "Bing".metaData.hidden = true;
            "Google".metaData.hidden = true;
          };
        };

        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.toolbars.bookmarks.visibility" = "never";
          "accessibility.browsewithcaret_shortcut.enabled" = false;
          "browser.ctrlTab.sortByRecentlyUsed" = true;
          "browser.download.useDownloadDir" = false;
          "browser.uiCustomization.state" = "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"urlbar-container\",\"save-to-pocket-button\",\"downloads-button\",\"fxa-toolbar-menu-button\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"firefox-view-button\",\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\"],\"currentVersion\":20,\"newElementCount\":2}";
          "privacy.donottrackheader.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
        };

        userChrome = ''
          /* Hides the native tabs */
          #TabsToolbar {
            visibility: collapse;
          }

          /* Auto-hide sidebar when fullscreen */
          #main-window[inFullscreen] #sidebar-box,
          #main-window[inFullscreen] #sidebar-splitter {
            display: none !important;
            width: 0px !important;
          }

          /* Hide main tabs toolbar */
          #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
              opacity: 0;
              pointer-events: none;
          }
          #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
              visibility: collapse !important;
          }

          /* Sidebar min and max width removal */
          #sidebar-box {
              max-width: none !important;
              min-width: 0px !important;
          }
          /* Hide splitter, when using Tree Style Tab. */
          #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] + #sidebar-splitter {
              display: none !important;
          }
          /* Hide sidebar header, when using Tree Style Tab. */
          #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
              visibility: collapse;
          }

          /* Shrink sidebar until hovered, when using Tree Style Tab. */
          :root {
              --thin-tab-width: 30px;
              --wide-tab-width: 200px;
          }
          #sidebar-box:not([sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"]) {
              min-width: var(--wide-tab-width) !important;
              max-width: none !important;
          }
          #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] {
              position: relative !important;
              transition: all 100ms !important;
              min-width: var(--thin-tab-width) !important;
              max-width: var(--thin-tab-width) !important;
          }
          #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"]:hover {
              transition: all 200ms !important;
              transition-delay: 0.2s !important;
              min-width: var(--wide-tab-width) !important;
              max-width: var(--wide-tab-width) !important;
              margin-right: calc((var(--wide-tab-width) - var(--thin-tab-width)) * -1) !important;
              z-index: 1;
          }
        '';
      };
      zero = {
        name = "zero";
        id = 1;
      };
    };
  };
}
