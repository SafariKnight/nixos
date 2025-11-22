{
  services.xserver.xkb = {
    layout = "cmk";
    options = "grp:win_space_toggle,altwin:menu_win";
    extraLayouts.cmk = {
      description = "Colemak DH with Wide and Symbol mods (Colemak CAWS)";
      symbolsFile = ./cmk;
      languages = ["eng"];
    };
  };
  console.useXkbConfig = true;
}
