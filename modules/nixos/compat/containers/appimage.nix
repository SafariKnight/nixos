{ ... }:
{
  hardware.i2c.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true; # no idea what a binfmt is
  };
}
