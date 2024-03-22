{ ... }: {

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {

        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" "hyprland/language" "hyprland/submap" ];
        modules-center = [ "clock" "hyprland/window" "custom/prayer" ];
        modules-right = [ "pulseaudio" "network" "custom/mem" "cpu" "custom/weather" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          disable-scroll = true;
        };

        "hyprland/language" = {
          format-en = "US";
          format-de = "DE";
          min-length = 5;
          tooltip = false;
        };

        "hyprland/submap" = {
          format = "pon {}";
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "🕙 {:%a, %d %b, %H:%M %p}";
        };

        "hyprland/window" = {
          max-length = 200;
          seperate-outputs = true;
        };

        "custom/prayer" = {
          format = "{} 🕋";
          interval = 60;
          exec = "$HOME/.config/waybar/scripts/prayer.py masjid-attawba-dusseldorf";
          tooltip = false;
          on-click = "xdg-open https://mawaqit.net/en/masjid-attawba-dusseldorf";
        };

        pulseaudio = {
          scroll-step = 2;
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-muted = " {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };

        network = {
          format = "{ifname}";
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname} 🌐";
          format-disconnected = ""; # empty format hides the module
          tooltip-format = "{ifname} via {gwaddr} 󰊗";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          max-lnnength = 50;
          on-click = "kitty nmtui";
        };

        "custom/mem" = {
          format = "{} ";
          interval = 3;
          exec = "free -h | awk '/Mem:/{printf $3}'";
          tooltip = false;
        };

        cpu = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        "custom/weather" = {
          format = "{}";
          tooltip = true;
          interval = 1800;
          exec = "$HOME/.config/waybar/scripts/wttr.py";
          return-type = "json";
        };

        tray = {
          icon-size = 16;
          spacing = 0;
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: FontAwesome, sans-serif;
          min-height: 20px;
      }

      window#waybar {
          background: transparent;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      #workspaces {
          margin-right: 8px;
          border-radius: 10px;
          transition: none;
          background: #383c4a;
      }

      #workspaces button {
          transition: none;
          color: #7c818c;
          background: transparent;
          padding: 5px;
          font-size: 18px;
      }

      #workspaces button.persistent {
          color: #7c818c;
          font-size: 12px;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          border-radius: inherit;
          color: #383c4a;
          background: #7c818c;
      }

      #workspaces button.active {
          background: #4e5263;
          color: white;
          border-radius: inherit;
      }

      #language {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px 10px 10px 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #submap {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #clock {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px 0px 0px 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #window {
          padding-left: 16px;
          padding-right: 16px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
          border-left: solid black 1px;
          min-width:  300px;
      }

      #custom-prayer {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 0px 10px 10px 0px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
          border-left: solid black 1px;
      }

      #pulseaudio {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #pulseaudio.muted {
          background-color: #90b1b1;
          color: #2a5c45;
      }

      #network {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #custom-mem {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #cpu {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #custom-weather {
          margin-right: 8px;
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      #tray {
          padding-left: 16px;
          padding-right: 16px;
          border-radius: 10px;
          transition: none;
          color: #ffffff;
          background: #383c4a;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }
    '';
  };
}
