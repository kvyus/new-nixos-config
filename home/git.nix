{ pkgs, ... }:
{
   programs.git = {
      enable = true;
      settings = {
         user = {
            name = "kvyus";
            email = "215489811+kvyus@users.noreply.github.com";
         };
      };
   };

   services.ssh-agent.enable = true;

   programs.ssh = {
     enable = true;
   };
}
