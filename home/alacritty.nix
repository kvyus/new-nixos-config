{ pkgs, lib, ... }:
{
   programs.alacritty = {
      enable = true;
      theme = "kanagawa_dragon";
      settings = {
         window = { 
            padding = {
               x = 5;
               y = 5;
            }; 
            opacity = 1;
         };
         font = {
	    normal = {
               family = "IosevkaTerm Nerd Font";
            };	
            size = 14;
         };
      };
   };
}
