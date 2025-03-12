{ config, ... }:
{
  programs.zellij.enable = true;
  xdg.configFile.zellij.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/dotfiles/zellij/";
}
