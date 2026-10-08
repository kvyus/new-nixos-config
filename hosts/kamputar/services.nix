{ pkgs, config, ... }:
{
   services = {
      displayManager = {
         enable = true;
         sddm = {
            enable = true;
	    wayland.enable = true;
         };
      };
      pipewire = {
         enable = true;
         alsa.enable = true;
         alsa.support32Bit = true;
         pulse.enable = true;
         wireplumber.enable = true;
      };
      flatpak = {
         enable = true;
         packages = [
            "org.vinegarhq.Sober"
         ];
         update.onActivation = true;
      };
   };
}
