{
  configurations.hjem.kareem = {
    impurity,
    pkgs,
    ...
  }: {
    hjem.users.kareem = {
      xdg.config.files = let
        inherit (impurity) link;
      in {
        "mpv/scripts/autoload".source = link ./scripts/autoload;
        "mpv/shaders".source = link ./shaders;
      };

      rum.programs.mpv = {
        enable = true;
        scripts = with pkgs.mpvScripts; [
          uosc
          thumbfast
        ];
        config = {
          profile = "gpu-hq";
          gpu-api = "vulkan";
          gpu-context = "wayland";
          deband = "yes";
          deband-iterations = 2;
          deband-threshold = 35;
          deband-range = 20;
          deband-grain = 5;
          dither-depth = "auto";
          scale = "ewa_lanczossharp";
          dscale = "mitchell";
          cscale = "spline64";
          glsl-shaders = "~~/shaders/adaptive-sharpen.glsl";
          cache = "yes";
          demuxer-max-bytes = "2000M";
          demuxer-max-back-bytes = "1000M";
          vd-queue-enable = "yes";
          ad-queue-enable = "yes";
          vd-queue-max-bytes = "6000MiB";
          vd-queue-max-samples = 2000000;
          vd-queue-max-secs = 50;
          keep-open = "yes";
          save-position-on-quit = "yes";
          screenshot-format = "png";
          screenshot-dir = "~/Pictures/mpv";
          screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";
          screenshot-sw = "yes";
          screenshot-high-bit-depth = "yes";
          screenshot-png-compression = 1;
          alang = "ja,jp,jpn,en,eng,de,deu,ger";
          slang = "en,eng,de,deu,ger";
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
          sub-border-size = 1;
          sub-shadow-color = "0.0/0.0/0.0/0.5";
          sub-shadow-offset = 0.2;
          osc = "no";
          osd-bar = "no";
          cursor-autohide = 3500;
          ytdl-format = "bestvideo[height<=?480][vcodec!=?vp9]+bestaudio/best";
        };
        scriptOpts = {
          thumbfast = {
            socket = "";
            thumbnail = "";
            max_height = 200;
            max_width = 200;
            scale_factor = 1;
            tone_mapping = "auto";
            overlay_id = 42;
            spawn_first = "no";
            quit_after_inactivity = 0;
            network = "no";
            audio = "no";
            hwdec = "no";
            direct_io = "no";
            mpv_path = "mpv";
          };
          uosc = {
            timeline_style = "line";
            timeline_line_width = 2;
            timeline_size = 40;
            timeline_persistency = "paused,audio";
            timeline_border = 1;
            timeline_step = "5";
            timeline_cache = "yes";
            progress = "never";
            progress_size = 2;
            progress_line_width = 20;
            controls = "menu,gap,<video,audio>subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality,gap,space,<video,audio>speed,space,shuffle,loop-playlist,loop-file,gap,prev,items,next,gap,fullscreen";
            controls_size = 32;
            controls_margin = 8;
            controls_spacing = 2;
            controls_persistency = "";
            volume = "right";
            volume_size = 40;
            volume_border = 1;
            volume_step = 1;
            volume_persistency = "";
            speed_step = 0.1;
            speed_step_is_factor = "no";
            speed_persistency = "";
            menu_item_height = 36;
            menu_min_width = 260;
            menu_padding = 4;
            menu_type_to_search = "yes";
            top_bar = "no-border";
            top_bar_size = 40;
            top_bar_controls = "right";
            top_bar_title = "yes";
            top_bar_alt_title = "";
            top_bar_alt_title_place = "below";
            top_bar_flash_on = "video,audio";
            top_bar_persistency = "";
            window_border_size = 1;
            autoload = "no";
            shuffle = "no";
            scale = 1;
            scale_fullscreen = 1.3;
            font_scale = 1;
            text_border = 1.2;
            border_radius = 4;
            color = "";
            opacity = "";
            refine = "";
            animation_duration = 100;
            flash_duration = 1000;
            proximity_in = 40;
            proximity_out = 120;
            font_bold = "no";
            destination_time = "playtime-remaining";
            time_precision = 0;
            buffered_time_threshold = 60;
            autohide = "no";
            pause_indicator = "flash";
            stream_quality_options = "4320,2160,1440,1080,720,480,360,240,144";
            video_types = "3g2,3gp,asf,avi,f4v,flv,h264,h265,m2ts,m4v,mkv,mov,mp4,mp4v,mpeg,mpg,ogm,ogv,rm,rmvb,ts,vob,webm,wmv,y4m";
            audio_types = "aac,ac3,aiff,ape,au,cue,dsf,dts,flac,m4a,mid,midi,mka,mp3,mp4a,oga,ogg,opus,spx,tak,tta,wav,weba,wma,wv";
            image_types = "apng,avif,bmp,gif,j2k,jp2,jfif,jpeg,jpg,jxl,mj2,png,svg,tga,tif,tiff,webp";
            subtitle_types = "aqt,ass,gsub,idx,jss,lrc,mks,pgs,pjs,psb,rt,sbv,slt,smi,sub,sup,srt,ssa,ssf,ttxt,txt,usf,vt,vtt";
            playlist_types = "m3u,m3u8,pls,url,cue";
            load_types = "video,audio,image";
            default_directory = "~/";
            show_hidden_files = "no";
            use_trash = "no";
            adjust_osd_margins = "yes";
            chapter_ranges = "openings:30abf964,endings:30abf964,ads:c54e4e80";
            chapter_range_patterns = "openings:オープニング;endings:エンディング";
            languages = "slang,en";
            subtitles_directory = "~~/subtitles";
            disable_elements = "";
          };
        };
      };
    };
  };
}
