{
  lib,
  stdenvNoCC,
  fetchzip,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "gandi-sans";
  version = "1.0";
  name = "${pname}-${version}";
  src = fetchzip {
    url = "https://www.fontsquirrel.com/fonts/download/gandhi-sans";
    stripRoot = false;
    hash = "sha256-Wb7Z2p2+L9XvEyJm0MpNFv5cP/wIjHu8vyNF9evL+bs=";
    extension = "zip";
  };

  installPhase = ''
    install -m444 -Dt $out/share/fonts/opentype/${pname} *otf
  '';

  meta = with lib; {
    homepage = "www.fontsquirrel.com/fonts/gandhi-sans";
    description = "A typeface I use for MPV";
  };
}
