# This is too big, right?
{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # --- System, Core Utilities & Filesystem ---
      stdenv.cc.cc
      coreutils
      util-linux
      systemd
      zlib
      zstd
      xz
      bzip2
      acl
      attr
      fuse
      fuse3
      e2fsprogs
      libxml2
      libelf
      libuuid
      libsodium
      libxcrypt
      libxcrypt-legacy
      keyutils
      icu
      gmp
      expat

      # --- Desktop, GTK & GUI Support ---
      gtk2
      gtk3
      glib
      dbus
      dbus-glib
      gdk-pixbuf
      cairo
      pango
      harfbuzz
      atk
      at-spi2-atk
      at-spi2-core
      libnotify
      zenity
      libappindicator-gtk2
      libappindicator-gtk3
      libdbusmenu
      libdbusmenu-gtk2
      libindicator-gtk2
      desktop-file-utils
      gsettings-desktop-schemas
      libsecret

      # --- X11 & Wayland ---
      xorg.libX11
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXft
      xorg.libXi
      xorg.libXinerama
      xorg.libXmu
      xorg.libXrandr
      xorg.libXrender
      xorg.libXScrnSaver
      xorg.libXt
      xorg.libXtst
      xorg.libXxf86vm
      xorg.libxcb
      xorg.libxshmfence
      xorg.libpciaccess
      xorg.xcbutil
      xorg.xcbutilimage
      xorg.xcbutilkeysyms
      xorg.xcbutilrenderutil
      xorg.xcbutilwm
      xorg.xkeyboardconfig
      libxkbcommon
      wayland

      # --- Graphics & Rendering ---
      mesa
      libGL
      libGLU
      libglvnd
      libgbm
      libdrm
      libva
      libvdpau
      vulkan-loader
      freeglut
      glew110
      libcaca

      # --- Audio & Multimedia ---
      pipewire
      libpulseaudio
      libjack2
      alsa-lib
      ffmpeg
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-ugly
      libmikmod
      libogg
      libvorbis
      libtheora
      libvpx
      flac
      speex
      libsamplerate
      libcanberra

      # --- Images & Fonts ---
      libpng
      libpng12
      libjpeg
      libtiff
      fontconfig
      freetype
      fribidi
      librsvg
      libthai
      pixman
      tbb

      # --- SDL & Gaming ---
      SDL
      SDL2
      SDL2_image
      SDL2_mixer
      SDL2_ttf
      SDL_image
      SDL_mixer
      SDL_ttf
      libudev0-shim

      # --- Network, Security & Hardware ---
      curl
      openssl
      nspr
      nss
      libssh
      libidn
      libcap
      libgcrypt
      libgpg-error
      libusb1
      pciutils
      networkmanager
      cups

      # --- Development & Languages ---
      python3
      libclang.lib
    ];
  };
}
