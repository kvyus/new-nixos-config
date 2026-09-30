{
   description = "flake";

   inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
      home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
      }; 
      spicetify-nix.url = "github:Gerg-L/spicetify-nix";
      mangowm = {
         url = "github:mangowm/mango";
         inputs.nixpkgs.follows = "nixpkgs";
      };
   };

   outputs = { nixpkgs, home-manager, ... } @inputs: {
      nixosConfigurations.kamputar = nixpkgs.lib.nixosSystem {
         specialArgs = { inherit inputs; };
         modules = [
            ./nixos/configuration.nix
            inputs.nix-flatpak.nixosModules.nix-flatpak
         ];
      };		
      homeConfigurations."mitra" = home-manager.lib.homeManagerConfiguration {
         extraSpecialArgs = { inherit inputs; };
         pkgs = nixpkgs.legacyPackages.x86_64-linux;
         modules = [
            inputs.spicetify-nix.homeManagerModules.default
            inputs.mangowm.hmModules.mango
            ./home/home.nix
         ];
      };
   };
}
