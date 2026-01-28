{
  configurations.hjem.kareem = {
    pkgs,
    lib,
    ...
  }: let
    extraPackages = with pkgs; [
      nixd
      alejandra
    ];
  in {
    hjem.users.kareem = {
      packages = [
        (pkgs.symlinkJoin {
          name = "${lib.getName pkgs.zed-editor}-wrapped-${lib.getVersion pkgs.zed-editor}";
          paths = [pkgs.zed-editor];
          buildInputs = [pkgs.makeWrapper];
          postBuild = ''
            wrapProgram $out/bin/zeditor \
              --prefix PATH : ${lib.makeBinPath extraPackages}
          '';
        })
      ];
    };
  };
}
