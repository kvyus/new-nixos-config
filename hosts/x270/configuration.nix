
{ config, pkgs, ... }:

{
   imports = [ 
      ./hardware-configuration.nix
      ./services.nix
   ];

   boot.loader.grub.enable = true;
   boot.loader.grub.device = "nodev";
   boot.loader.grub.useOSProber = true;
   boot.loader.grub.efiSupport = true;
   boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "x270"; 

   networking.networkmanager.enable = true;

   time.timeZone = "Europe/Kyiv";

   i18n.defaultLocale = "en_US.UTF-8";

   xdg.portal = {
      enable = true;
      wlr = {
      	  enable = true;
      	  settings = {
      	  	   screencast = {
      	  	     	      chooser_type = "simple";
      		     	      chooser_cmd = "${pkgs.slurp}/bin/slurp -f '%o' -or";
          		      };
      	  };
      };
      extraPortals = with pkgs; [
         xdg-desktop-portal-gtk
      ];
   };

   programs.zsh.enable = true;

   users.users.mitra = {
      isNormalUser = true;
      description = "mitra";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
   };

   nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

   hardware.graphics = {
      enable = true;
      enable32Bit = true;
   };

   virtualisation.waydroid.enable = true;
   programs.dconf.enable = true;

   programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
   };

   programs.gamemode.enable = true;

   nixpkgs.config.allowUnfree = true;

   environment.systemPackages = with pkgs; [
      curl
      git
      home-manager
   ];

   fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.iosevka-term
   ];

   environment.etc."udev/hwdb.d/90-x270-keyboard.hwdb".text = ''
      evdev:atkbd:dmi:bvn*:bvr*:bd*:svnLENOVO:pn20K60018MZ:*
       KEYBOARD_KEY_56=z
   '';

   system.activationScripts.x270-hwdb = {
      text = ''
         ${pkgs.systemd}/bin/systemd-hwdb update
      '';
   };

   nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
   };
   
   system.stateVersion = "26.11";
}
