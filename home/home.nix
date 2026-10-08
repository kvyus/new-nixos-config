{ config, pkgs, ... }:
{
   imports = [
      ./waybar.nix
      ./spicetify.nix
      ./alacritty.nix
      ./fuzzel.nix 
      ./git.nix
      ./firefox.nix
      ./mango.nix
      ./zsh.nix
   ];
   home.username = "mitra";
   home.homeDirectory = "/home/mitra";

   home.stateVersion = "26.11";
   home.enableNixpkgsReleaseCheck = false;

   nixpkgs.config.allowUnfree = true; 

   home.packages = with pkgs; [
      lsd
      imv
      vlc
      unzip
      ayugram-desktop
      zoom-us
      wl-clipboard
      killall
      vesktop
      swaybg
      zathura
      clang-tools
      gcc
      devenv
      hyprshot
      slurp
      grim
      gopls
      go
      xournalpp
   ];
   home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
      size = 24;
   };

   gtk = {
      enable = true;
#      iconTheme = {
#         package = pkgs.tela-circle-icon-theme.override { colorVariants = [ "red" ]; };
#         name = "Tela-circle-red";
#      };
      gtk4 = {
         enable = true;
         theme.name = "gruvbox-dark";
         font = {
            name = "JetBrainsMono Nerd Font";
            size = 13;
         };
#         iconTheme = {
#            package = pkgs.tela-circle-icon-theme.override { colorVariants = [ "red" ]; };
#            name = "Tela-circle-red";
#         };
      };
   };

   home.sessionVariables = {
      EDITOR = "nvim";
   };

   programs.obs-studio.enable = true;

   programs.emacs = {
      enable = true;
      extraPackages = epkgs: [ epkgs.vterm ];
   };

#   services.mako.enable = true;
   services.mako.settings = {
      default-timeout = 5; 
   };

   programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableFishIntegration = true;
   };

   programs.home-manager.enable = true;
 
} 
