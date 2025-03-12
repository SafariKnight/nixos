default:
    just --list

rebuild flake="$(uname -n)": _sudo
  #!/usr/bin/env bash
  just _rebuild {{ flake }} &&
  notify-send -e "NixOS Rebuild" "OK!" --icon=emblem-ok-symbolic ||
  notify-send -e "NixOS Rebuild" "FAILED!" --icon=window-close-symbolic

test flake="$(uname -n)": _sudo
  #!/usr/bin/env bash
  just _test {{ flake }} &&
  notify-send -e "NixOS Test" "OK!" --icon=emblem-ok-symbolic ||
  notify-send -e "NixOS Test" "FAILED!" --icon=window-close-symbolic

update flake="$(uname -n)": _sudo
  #!/usr/bin/env bash
  just _update {{ flake }} &&
  notify-send -e "NixOS Update" "OK!" --icon=emblem-ok-symbolic ||
  notify-send -e "NixOS Update" "FAILED!" --icon=window-close-symbolic

@_sudo:
  sudo -l > /dev/null

_format:
  nix fmt &>/dev/null

_rebuild flake: _format
  nh os switch $(pwd) -H {{flake}}

_test flake: _format
  nh os test $(pwd) -H {{flake}}

_update flake: _format
  nh os switch $(pwd) -H {{flake}} -u
