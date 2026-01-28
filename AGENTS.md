# AGENTS.md

## Commands
- `just switch` - Rebuild and switch NixOS configuration (uses `nh os switch`)
- `just test` - Test configuration without switching
- `just update` - Update flake inputs and rebuild
- `nix fmt` - Format all files using treefmt (alejandra, statix, deadnix, etc.)
- `nix flake check` - Validate flake outputs

## Architecture (Dendritic Pattern)
This config uses the **dendritic pattern**: every `.nix` file is a flake-parts module auto-imported via `import-tree`.
- `modules/hosts/<host>/` - Host configs defining `configurations.nixos.<host>` with `deferredModule`
- `modules/users/<user>/` - User configs defining `configurations.hjem.<user>` (hjem = home-manager alternative)
- `modules/nixos/` - Shared NixOS modules exposed as `flake.modules.nixos.<name>`
- `modules/hjem-ext/` - Custom hjem module extensions (`flake.modules.hjem.ext`)
- `modules/pkgs/` - Custom package definitions
- `modules/flake-parts/` - Flake-level options (configurations.nix defines the deferredModule options)

**User management**: `configurations.hjem.<name>` auto-generates `flake.modules.nixos."user/<name>"`. Hosts import users via `config.flake.modules.nixos."user/<username>"` (see hosts/krypton/default.nix).

## Code Style
- **Formatter**: alejandra (Nix), statix/deadnix (linting), shfmt (shell), stylua (lua)
- **Module pattern**: Every file returns `{ ... }: { ... }` - a flake-parts module
- **Host config**: Set `configurations.nixos.<name> = { pkgs, ... }: { ... };` using deferredModule
- **User config**: Set `configurations.hjem.<name> = { pkgs, ... }: { ... };` for hjem users
- **Reusable modules**: Define as `flake.modules.nixos.<name>` or `flake.modules.hjem.<name>`
- **Imports**: Destructure `{ lib, inputs, config, ... }:` at top; access other modules via `config.flake.modules.*`
- **Naming**: kebab-case for files; use `lib.mkDefault` for overridable defaults

## Key Patterns
- **hjem-ext extensions**: Each file sets `flake.modules.hjem.ext = { ... }: { options.ext.programs.<name> = ...; }` directly; deferredModule merges them automatically
- **hjem-rum**: Pre-built hjem modules for common programs (ghostty, gtk, fish, etc.) accessed via `rum.programs.<name>`
- **Custom packages**: `modules/pkgs/_packages/` uses `packagesFromDirectoryRecursive`; each subfolder has `package.nix`
- **Special packages**: `modules/pkgs/_special/` for complex packages (e.g., knv/neovim) that need custom build logic beyond simple `package.nix`
- **Auto-files**: `modules/users/<user>/files/_auto/` maps files to home directory; `.nix` files are evaluated, others symlinked via impurity
