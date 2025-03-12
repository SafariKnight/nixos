{ pkgs, ... }:
{
  home.packages = [
    pkgs.gandhi-sans
  ];
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
    ];
    config = {
      profile = "gpu-hq";
      gpu-api = "vulkan";

      deband = "yes";
      deband-iterations = 2;

      deband-threshold = 35;
      deband-range = 20;
      deband-grain = 5;

      dither-depth = "auto";

      # Scaling
      scale = "ewa_lanczossharp";
      dscale = "mitchell";
      cscale = "spline64";

      ## Behavior (personal preference)
      keep-open = "yes";
      save-position-on-quit = true;

      ## Screenshots
      screenshot-format = "png";
      screenshot-dir = "~/Pictures/mpv";
      screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";
      screenshot-sw = "yes";
      screenshot-high-bit-depth = "yes";
      screenshot-png-compression = 1;

      ## Language
      # Audio language priority
      alang = "ja,jp,jpn,en,eng,de,deu,ger";

      # Subtitle language priority
      slang = "en,eng,de,deu,ger";

      # # Subs
      sub-ass-override = "yes";
      sub-ass-style-overrides = [
        "playresx=1920,playresy=1080"
        "Kerning=yes"
      ];
      sub-bold = "yes";
      sub-font = "Gandhi Sans";
      sub-font-size = 30;
      sub-blur = 0.1;
      sub-color = "1.0/1.0/1.0/1.0";
      # sub-border-color=0.0/0.0/0.0/1.0
      sub-border-size = 1;
      # sub-border-offset=2
      # sub-margin-x=100
      # sub-margin-y=50
      sub-shadow-color = "0.0/0.0/0.0/0.5";
      sub-shadow-offset = 0.2;

      osc = "no";
      cursor-autohide = 3500;
      osd-bar = "no";

      # # External
      ytdl-format = "bestvideo[height<=?480][vcodec!=?vp9]+bestaudio/best";
    };
  };
}
