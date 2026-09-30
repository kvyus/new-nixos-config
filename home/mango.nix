{ pkgs, ... }:
{
   wayland.windowManager.mango = {
      enable = true;
      systemd.enable = true;

      autostart_sh = ''
	 swaybg -i ~/Downloads/yahwe.png &
         waybar &	
      '';

      settings = {

         monitorrule = "name:HDMI-A-1,width:1920,height:1080,refresh:100,vrr:0";

         circle_layout="scroller";

         #INPUT
         xkb_rules_layout = "us,ru,ua";
         xkb_rules_options = "grp:caps_toggle";

         mouse_accel_profile = 0;
   
         #FOCUS
         focus_on_activate = 0;
         sloppyfocus = 0;
         warpcursor = 0;

         #VISUAL
         borderpx = 2;
         gappih = 3;
         gappiv = 3;

         gappoh = 7;
         gappov = 7;

         border_radius = 0;

         focuscolor = "0xc5c9c5ff";
         bordercolor = "0x393836ff";
         urgentcolor = "0xc4746eff";

         animations = 0;

         #SCROLLING
         scroller_default_proportion = 0.5;
         scroller_ignore_proportion_single = 0;
         scroller_structs = 7;

         #BINDS
         bind = [
            "SUPER,code:54,killclient"
            "SUPER,code:55,togglefloating" 
            "SUPER,code:41,togglefullscreen"     

            "SUPER,code:44,focusdir,left"
            "SUPER,code:45,focusdir,down"
            "SUPER,code:46,focusdir,up"
            "SUPER,code:47,focusdir,right"
             
            "SUPER+SHIFT,code:44,exchange_client,left"
            "SUPER+SHIFT,code:45,exchange_client,down"
            "SUPER+SHIFT,code:46,exchange_client,up"
            "SUPER+SHIFT,code:47,exchange_client,right"

            "SUPER,Return,spawn,alacritty"
            "SUPER,code:40,spawn,vesktop"
            "SUPER,code:57,spawn,firefox"
            "SUPER,code:38,spawn,AyuGram"
            "SUPER,code:39,spawn,spotify"
            "SUPER,code:25,spawn,steam"
            "SUPER,code:24,spawn,fuzzel"
            "SUPER,code:26,spawn,nemo"
            "SUPER+SHIFT,code:58,quit"
            "SUPER,code:31,spawn,hyprshot -m region"
            "SUPER,code:32,spawn,hyprshot -m output"

            "NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_SINK@ 5%+"
            "NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_SINK@ 5%-"
            "NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SINK@ toggle"

            "SUPER,1,view,1"
            "SUPER,2,view,2"
            "SUPER,3,view,3"
            "SUPER,4,view,4"
            "SUPER,5,view,5"
            "SUPER,6,view,6"
            "SUPER,7,view,6"
            "SUPER,8,view,8"
            "SUPER,9,view,9"

            "SUPER+SHIFT,1,tag,1"
            "SUPER+SHIFT,2,tag,2"
            "SUPER+SHIFT,3,tag,3"
            "SUPER+SHIFT,4,tag,4"
            "SUPER+SHIFT,5,tag,5"
            "SUPER+SHIFT,6,tag,6"
            "SUPER+SHIFT,7,tag,6"
            "SUPER+SHIFT,8,tag,8"
            "SUPER+SHIFT,9,tag,9"
         ];

         mousebind = [
            "SUPER,btn_left,moveresize,curmove"
            "SUPER,btn_right,moveresize,curresize"
         ];

         #RULES
         tagrule = [
            "id:1,layout_name:scroller"
            "id:2,layout_name:scroller"
            "id:3,layout_name:scroller"
            "id:4,layout_name:scroller"
            "id:5,layout_name:scroller"
            "id:6,layout_name:scroller"
            "id:7,layout_name:scroller"
            "id:8,layout_name:scroller"
            "id:9,layout_name:scroller"
         ];
      };
   };
}
