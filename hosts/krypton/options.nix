{ ... }:
{
  modules.boot.greetd.enable = true;
  modules.boot.greetd.command = "Hyprland";
  modules.boot.greetd.startupUser = "kareem";

  modules.desktop.plasma.enable = true;

  modules.desktop.hyprland.enable = true;

  modules.desktop.sway.enable = true;
  modules.desktop.sway.systemd.enable = true;
  modules.desktop.sway.xwayland.enable = true;
  modules.desktop.sway.fx = true;

  modules.nix.nh.flakePath = "/home/kareem/nixos-config";

  modules.keyboard.keyd.enable = true;
}
