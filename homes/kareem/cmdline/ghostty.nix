{
  programs.ghostty = {
    enable = true;
    settings = {
      # Window
      background-opacity = 1;
      window-decoration = false;

      command = "fish";
      gtk-single-instance = true;
      gtk-tabs-location = "bottom";
      gtk-wide-tabs = false;

      # Cursor
      cursor-style-blink = false;
      adjust-cursor-thickness = 1;
      shell-integration-features = "no-cursor, sudo, no-title";

      # Font
      font-family = "Jetbrains Mono";
      font-style = "SemiBold";
      font-style-bold = "Bold";
      font-style-italic = "SemiBold Italic";
      font-style-bold-italic = "Bold Italic";
      font-size = 13;

      confirm-close-surface = false;

      # Disable most bindings... yeah I don't want any bindings
      keybind = [
        "ctrl+comma=unbind"
        "shift+insert=unbind"
        "ctrl+page_down=unbind"
        # "ctrl+shift+v=unbind"
        "ctrl+alt+up=unbind"
        "ctrl+shift+a=unbind"
        "ctrl+h=unbind"
        "shift+up=unbind"
        "ctrl+l=unbind"
        "alt+five=unbind"
        "super+ctrl+right_bracket=unbind"
        # "ctrl+equal=unbind"
        "ctrl+shift+o=unbind"
        # "ctrl+shift+c=unbind"
        "ctrl+shift+q=unbind"
        "ctrl+shift+n=unbind"
        "ctrl+shift+page_down=unbind"
        "ctrl+shift+comma=unbind"
        # "ctrl+minus=unbind"
        "shift+left=unbind"
        "super+ctrl+shift+up=unbind"
        "alt+eight=unbind"
        "shift+page_up=unbind"
        "ctrl+alt+shift+j=unbind"
        "ctrl+shift+left=unbind"
        "ctrl+shift+w=unbind"
        "super+ctrl+shift+equal=unbind"
        "shift+end=unbind"
        # "ctrl+zero=unbind"
        "alt+three=unbind"
        "ctrl+shift+j=unbind"
        "ctrl+enter=unbind"
        "ctrl+page_up=unbind"
        "shift+right=unbind"
        "ctrl+tab=unbind"
        "ctrl+alt+left=unbind"
        "shift+page_down=unbind"
        "ctrl+shift+right=unbind"
        "ctrl+k=unbind"
        "ctrl+shift+page_up=unbind"
        "alt+nine=unbind"
        "ctrl+shift+t=unbind"
        "shift+down=unbind"
        "super+ctrl+shift+left=unbind"
        "ctrl+shift+tab=unbind"
        "alt+two=unbind"
        "ctrl+alt+down=unbind"
        "super+ctrl+shift+down=unbind"
        "super+ctrl+shift+right=unbind"
        # "ctrl+plus=unbind"
        "alt+four=unbind"
        "ctrl+j=unbind"
        "ctrl+insert=unbind"
        "ctrl+shift+e=unbind"
        "ctrl+alt+right=unbind"
        "alt+f4=unbind"
        "alt+one=unbind"
        "ctrl+shift+enter=unbind"
        "shift+home=unbind"
        "super+ctrl+left_bracket=unbind"
        "ctrl+shift+i=unbind"
        "alt+six=unbind"
        "alt+seven=unbind"
      ];

      # Colors
      theme = "catppuccin-mocha";
    };
  };
}

# List of all default bindings for historical reasons
# ctrl+comma=open_config
# shift+insert=paste_from_selection
# ctrl+page_down=next_tab
# ctrl+shift+v=paste_from_clipboard
# ctrl+alt+up=goto_split:up
# ctrl+shift+a=select_all
# ctrl+h=goto_split:left
# shift+up=adjust_selection:up
# ctrl+l=goto_split:right
# alt+five=goto_tab:5
# super+ctrl+right_bracket=goto_split:next
# ctrl+equal=increase_font_size:1
# ctrl+shift+o=new_split:right
# ctrl+shift+c=copy_to_clipboard
# ctrl+shift+q=quit
# ctrl+shift+n=new_window
# ctrl+shift+page_down=jump_to_prompt:1
# ctrl+shift+comma=reload_config
# ctrl+minus=decrease_font_size:1
# shift+left=adjust_selection:left
# super+ctrl+shift+up=resize_split:up,10
# alt+eight=goto_tab:8
# shift+page_up=scroll_page_up
# ctrl+alt+shift+j=write_screen_file:open
# ctrl+shift+left=previous_tab
# ctrl+shift+w=close_tab
# super+ctrl+shift+equal=equalize_splits
# shift+end=scroll_to_bottom
# ctrl+zero=reset_font_size
# alt+three=goto_tab:3
# ctrl+shift+j=write_screen_file:paste
# ctrl+enter=toggle_fullscreen
# ctrl+page_up=previous_tab
# shift+right=adjust_selection:right
# ctrl+tab=next_tab
# ctrl+alt+left=goto_split:left
# shift+page_down=scroll_page_down
# ctrl+shift+right=next_tab
# ctrl+k=goto_split:up
# ctrl+shift+page_up=jump_to_prompt:-1
# alt+nine=last_tab
# ctrl+shift+t=new_tab
# shift+down=adjust_selection:down
# super+ctrl+shift+left=resize_split:left,10
# ctrl+shift+tab=previous_tab
# alt+two=goto_tab:2
# ctrl+alt+down=goto_split:down
# super+ctrl+shift+down=resize_split:down,10
# super+ctrl+shift+right=resize_split:right,10
# ctrl+plus=increase_font_size:1
# alt+four=goto_tab:4
# ctrl+j=goto_split:down
# ctrl+insert=copy_to_clipboard
# ctrl+shift+e=new_split:down
# ctrl+alt+right=goto_split:right
# alt+f4=close_window
# alt+one=goto_tab:1
# ctrl+shift+enter=toggle_split_zoom
# shift+home=scroll_to_top
# super+ctrl+left_bracket=goto_split:previous
# ctrl+shift+i=inspector:toggle
# alt+six=goto_tab:6
# alt+seven=goto_tab:7
