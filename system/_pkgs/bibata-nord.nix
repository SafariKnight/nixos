{
  lib,
  stdenvNoCC,
  ...
}:
let
  pname = "bibata-nord";
  version = "1.0";
in
stdenvNoCC.mkDerivation {
  inherit pname;
  name = "${pname}-${version}";
  src = ./bibata-nord;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r $src $out/share/icons/Bibata-Nord
    runHook postInstall
  '';
  meta = with lib; {
    description = "Nord Material Based Cursor Theme";
    homepage = "https://github.com/ful1e5/Bibata_Cursor";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [
      rawkode
      AdsonCicilioti
    ];
  };
}
