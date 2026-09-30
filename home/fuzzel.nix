{ pkgs, ... }:
{
   programs.fuzzel = {
      enable = true;
      settings = {
         colors = {
            background = "181616ff";
	    text = "c5c9c5ff";
            prompt = "c5c9c5ff";
            selection-text = "181616ff";
            selection = "c4746eff";
            border = "c5c9c5ff";
            input = "c5c9c5ff";
         };
         border = {
            radius = 6;
            width = 3;
         };
      };
   };
}
