{ ... }:
{
  services.xserver.xkb.extraLayouts.cmk = {
    description = "Colemak DH with Wide and Symbol mods (Colemak CAWS)";
    symbolsFile = ./cmk;
    languages = [ "eng" ];
  };
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_wide_symbol";
  };
}
