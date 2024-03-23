{ ... }: {

  home.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.enableNvidiaPatches = true;

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1,highrr,0x0,auto"
      "HDMI-A-1,preferred,2560x0,auto"
    ];

    workspace = "1, monitor:DP-1, default:true";

    input = {
      kb_layout = "de";
      follow_mouse = "1";
      touchpad.natural_scroll = "no";
      sensitivity = "0";
    };

    general = {
      gaps_in = "5";
      gaps_out = "20";
      border_size = "2";
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      layout = "master";

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = "false";
    };

    decoration = {

      rounding = "10";

      blur = {
        enabled = "true";
        size = "3";
        passes = "1";
      };

      drop_shadow = "yes";
      shadow_range = "4";
      shadow_render_power = "3";
      "col.shadow" = "rgba(1a1a1aee)";
    };

    animations = {
      enabled = "yes";

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];

    };

    exec-once = [
      "waybar & hyprpaper & vesktop"
      "hyprctl setcursor Bibata-Modern-Ice 24"
    ];

    "$mod" = "SUPER";

    bind =
      [
        "$mod, RETURN, exec, kitty"
        "$mod, Q, killactive,"
        "$mod, E, exec, pcmanfm"
        "$mod, V, togglefloating,"
        "$mod, F, fullscreen, 0"
        "$mod, D, exec, rofi -show drun -show-icons"
        "$mod, W, exec, firefox"
        "bind = ALT, Tab, cyclenext"
        "bind = ALT, Tab, bringactivetotop"

        # Move focus with mod + hjkl
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        # Move windows with mod + hjkl
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        # scratchpad
        "$mod, S, togglespecialworkspace, magic"
        "$mod, T, movetoworkspace, special:magic"

        # screenshot
        "$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"

        # monocle mode (dwm)
        "$mod, M, fullscreen, 1"

        # Scroll through existing workspaces with mod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList
          (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };

}
