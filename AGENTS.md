# Agents Guide - NixOS Configuration

## Build & Test Commands

- **Format code**: `nix fmt` - Automatically formats all Nix/Lua/TOML/YAML/JSON/KDL/Fish/Shell files

## Commit Style

Use conventional commits with optional scopes:
- `feat: description` - New feature
- `fix: description` - Bug fix
- `chore: description` - Maintenance/build changes
- With scope: `feat(subsystem): description` (e.g., `feat(niri): ...`, `chore(flake.nix): ...`)
- Lowercase, concise descriptions

## Architecture & Structure

This is a personal NixOS flake-based configuration with modular structure:

- **systems/**: NixOS system configurations (currently `krypton` and `krypton-impure`)
- **modules/**: Custom modules (hjem-ext/ for hjem modules)
- **users/**: Per-user configurations (kareem/ user setup and common defaults)
- **pkgs/**: Custom packages and special package definitions
- **flake.nix**: Flake input definitions and treefmt configuration
- **Justfile**: Just commands for common tasks

Build tool: `nh` (nix-helper) for OS rebuilds, `treefmt-nix` for formatting.

## Code Style & Conventions

- **Language**: Nix Flake format with declarative module system
- **Formatting**: Automated via treefmt (alejandra for Nix, stylua for Lua, prettier for JSON/YAML)
- **File naming**: Snake_case for files; avoid underscores in module filenames (filtered out during import)
- **Nix conventions**: Use `lib.*`, inherit properly, leverage NixOS options over raw config
- **Comments**: Explain "why" for non-obvious configuration choices
- **Structure**: Each system/user gets own directory; common code in `common.nix` files
- **Error handling**: Let Nix evaluate and catch errors; validation through module system

## Imports & Module System

- Uses flake-parts for modular flake architecture
- Modules auto-loaded from system/user directories (recursive, .nix files, no underscores)
- specialArgs provide `inputs`, `self`, `inputs'`, `self'` to all modules
- Common patterns: `lib.flatten`, `lib.pipe`, `lib.filesystem.listFilesRecursive` for dynamic imports
