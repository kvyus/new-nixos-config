{ pkgs, ... }:
{
   programs.firefox = {
      enable = true;
      profiles.main = {
         isDefault = true;
         settings = {
            "sidebar.verticalTabs" = false;
         };
      };
   };
}
