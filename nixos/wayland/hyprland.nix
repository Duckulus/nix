{ ... }: {

  home.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  home.sessionVariables.XCURSOR_SIZE = "24";

  windowManager.hyprland.enable = true;
  windowManager.hyprland.enableNvidiaPatches = true;

  windowManager.hyprland.settings = {
    monitor = [
      "DP-1,highrr,0x0,auto"
      "HDMI-A-1,preferred,2560x0,auto"
    ];

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
      col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      col.inactive_border = "rgba(595959aa)";

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
      col.shadow = "rgba(1a1a1aee)";
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
      "waybar & hyprpaper"
    ];

    "$mod" = "SUPER";

    bind =
      [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit, "
        "$mainMod, E, exec, dolphin"
        "$mainMod, V, togglefloating,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, W, exec, firefox"

        # Move focus with mainMod + hjkl
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        # Move windows with mainMod + hjkl
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, L, movewindow, r"

        # scratchpad
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
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
  };

  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];

}
