{ pkgs, ... }:
{
   programs.waybar = {
      enable = true;

      settings = {
         mainBar = {
            height = 30;
            spacing = 6;

            modules-left = [
               "ext/workspaces"
               "pulseaudio"
            ];

            modules-center = [
               "clock"
            ];

            modules-right = [
               "network"
               "cpu"
            ];

            "clock" = {
               tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
               format-alt = "{:%Y-%m-%d}";
            };

	    "ext/workspaces" = {
	       ignore-hidden = true;
	    };

            "cpu" = {
               format = "CPU:{usage}% ";
               tooltip = false;
            };

            "memory" = {
               format = "{}%  ";
            };
            "network" = {
               format-wifi = "NET:{essid}"; 
               format-icons = [
                  "󰤯 "
                  "󰤟 "
                  "󰤢 "
                  "󰤥 "
                  "󰤨 "
               ];
               format-disconnected = "Disconnected 󰤭 ";
            };

            "pulseaudio" = {
               format = "VOL:{volume}%";
               format-muted = "MUT";
            };
         };
      };
      style = ''
         * {
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: "IosevkaTerm Nerd Font";
            font-size: 13px;
	    font-weight: normal;
	    padding: 0;
	    margin: 0;
         }

         window#waybar {
            background-color: #181616;
            transition-property: background-color;
            transition-duration: .5s;
         }

         window#waybar.hidden {
            opacity: 0.2;
         }


         window#waybar.termite {
            background-color: #3F3F3F;
         }

         window#waybar.chromium {
            background-color: #000000;
            border: none;
         }

         button {
            border: none;
            border-radius: 0;
         }

         button:hover {
            background: inherit;
         }

         #workspaces button {
            background: none;
            color: #c5c9c5;
            padding: 0 4px;
         }

         #workspaces button.active {
            background-color: #c4746e;
            color: #181616;
         }

         #clock,
         #battery,
         #cpu,
         #memory,
         #disk,
         #temperature,
         #backlight,
         #network,
         #pulseaudio,
         #wireplumber,
         #custom-media,
         #tray,
         #mode,
         #idle_inhibitor,

         #window {
            background-color: transparent
         }
         
         #workspaces {
            background-color: transparent;
            color: #f5f5f5;
         }

         .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
         }

         .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
         }

         #clock {
            background-color: transparent;
            color: #c5c9c5;
         }

         @keyframes blink {
            to {
               background-color: #ffffff;
               color: #000000;
            }
         }

	 label {
	    margin-top: 2px; 
	    padding-left: 1px;
	 }

         label:focus {
            background-color: #000000;
         }

         #cpu {
            background-color: transparent;
            color: #c5c9c5;
         }

         #memory {
            background-color: transparent;
            color: #c5c9c5;
         }

         #network {
            background-color: transparent;
            color: #c5c9c5;
         }

         #network.disconnected {
            background-color: #c4746e;
         }

         #pulseaudio {
            background-color: transparent;
            color: #c5c9c5;
         }

         #pulseaudio.muted {
            background-color: #C4746E;
            color: #181616;
         }

         #wireplumber {
            background-color: transparent;
            color: #c5c9c5;
         }

         #wireplumber.muted {
            background-color: #c4746e;
         }

         #tray {
            background-color: transparent;
         }

         #tray > .passive {
            -gtk-icon-effect: dim;
         }

         #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: #eb4d4b;
         }

         #language {
            background: transparent;
            color: #f5f5f5;
            padding: 0 5px;
            margin: 0 5px;
            min-width: 16px;
         }
      '';
   };
}
