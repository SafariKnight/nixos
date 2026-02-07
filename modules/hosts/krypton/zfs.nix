# {
#   configurations.nixos.krypton = {
#     pkgs,
#     config,
#     ...
#   }: let
#     inherit (pkgs) lib;
#     zfsCompatibleKernelPackages =
#       lib.filterAttrs (
#         name: kernelPackages:
#           (builtins.match "linux_[0-9]+_[0-9]+" name)
#           != null
#           && (builtins.tryEval kernelPackages).success
#           && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
#       )
#       pkgs.linuxKernel.packages;
#     latestKernelPackage = lib.last (
#       lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
#         builtins.attrValues zfsCompatibleKernelPackages
#       )
#     );
#   in {
#     boot.kernelPackages = latestKernelPackage;
#   };
# }
{inputs, ...}: {
  configurations.nixos.krypton = {
    pkgs,
    config,
    ...
  }: {
    nixpkgs.overlays = [inputs. nix-cachyos-kernel.overlays.pinned];
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

    boot.supportedFilesystems.zfs = true;
    boot.zfs.package = config.boot.kernelPackages.zfs_cachyos;
  };
}
