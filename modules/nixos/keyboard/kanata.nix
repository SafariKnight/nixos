{
  lib,
  config,
  ...
}:
let
  cfg = config.modules.keyboard.kanata;
in
{
  options = {
    modules.keyboard.kanata.enable = lib.mkEnableOption "Enable Kanata";
  };
  config = lib.mkIf cfg.enable {
    # modules.keyboard.kanata.enable = lib.mkDefault false;
    services.kanata = {
      enable = true;
      keyboards = {
        "default" = {
          extraDefCfg = "process-unmapped-keys yes";
          config = ''
            ;; Define the normal keyboard layout
            (defsrc ;; QWERTY
              grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
              tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
              caps a    s    d    f    g    h    j    k    l    ;    '    ret
              lsft z    x    c    v    b    n    m    ,    .    /    rsft
              lctl lmet lalt        spc              ralt comp rctl
            )

            ;; (defsrc ;; Colemak CAWS
            ;;   grv  1    2    3    4    5    6    \    7     8     9     0    =    bspc
            ;;   tab  q    w    f    p    b    [    j    l     u     y     '    -    ;
            ;;   caps a    r    s    t    g    ]    m    n     e     i     o    ret
            ;;   lsft x    c    d    v    z    /    k    h     ,     .     rsft
            ;;   lctl lmet lalt           spc            ralt  comp  rctl
            ;; )


            (deflayer base
              grv  1       2    3    4    5    6    7    8    9    0    -    =    bspc
              tab  q       w    e    r    t    y    u    i    o    p    [    ]    \
              @ext @lmet    @lalt    @lsft    @lctl    g    h    j    @rctl    @rsft    @ralt    @rmet    ret
              lsft z       x    c    v    b    n    m    ,    .    /    rsft
              lctl lmet    lalt        spc              ralt comp rctl
            )

            (defalias
              ext (tap-hold-release 0 200 esc (layer-while-held edit))

              lmet (tap-hold-release 175 200 a lmet)
              lalt (tap-hold-release 175 200 s lalt)
              lsft (tap-hold-release 175 200 d lsft)
              lctl (tap-hold-release 175 200 f lctl)

              rctl (tap-hold-release 175 200 k rctl)
              rsft (tap-hold-release 175 200 l rsft)
              ralt (tap-hold-release 175 200 ; lalt) ;; outputs lalt because fuck ralt
              rmet (tap-hold-release 175 200 ' rmet)
            )

            ;; (deflayer cmk-caws
            ;;   grv   1     2     3     4          5      6    \     7     8     9     0        =    bspc
            ;;   tab   q     w     f     p          b      [    j     l     u     y     '        -    ;
            ;;   @ext  @lmet @lalt @lsft @lctl      g      ]    m     @rctl @rsft @ralt @rmet    ret
            ;;   lsft  x     c     d     v          z      /    k     h     ,     .     rsft
            ;;   lctl lmet lalt            spc                     ralt  rmet  rctl
            ;; )

            ;; (deflayer name
            ;;   _    _    _    _    _    _    _    _    _    _    _    _    _    _
            ;;   _    _    _    _    _    _    _    _    _    _    _    _    _    _
            ;;   _    _    _    _    _    _    _    _    _    _    _    _    _
            ;;   _    _    _    _    _    _    _    _    _    _    _    _
            ;;   _    _    _              _              _    _    _
            ;; )


            (deflayer edit
              _    _    _    _    _    _    _    _    _    _    _     _    _    _
              _    _    _    _    _    _    _    _    _    _    _     del  _    _
              _    _    _    _    _    _    _    left down up   rght  bspc _
              _    _    _    _    _    _    _    _    _    _    _     _
              _    _    _              ret            _    _    _
            )
          '';
        };
      };
    };
  };
}
