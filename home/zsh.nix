{ config, pkgs, ... }:
{
   programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      shellAliases = {
         l = "lsd";
         v = "vim";
         c = "cd";
      };
      initContent = ''
         PROMPT=" %~ $ "
      '';
      oh-my-zsh = {
         enable = true;
         plugins = [
            "git"
         ];
      };
   }; 
}
