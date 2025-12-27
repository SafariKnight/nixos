{
  hjem.users.kareem.rum.programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        error_symbol = "[❯](red)";
        success_symbol = "[❯](purple)";
        vimcmd_symbol = "[❮](green)";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
      directory = {
        style = "blue";
        truncate_to_repo = false;
        truncation_length = 999;
      };
      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$character\n";
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_state = {
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
        style = "bright-black";
      };
      git_status = {
        conflicted = "​";
        deleted = "​";
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        modified = "​";
        renamed = "​";
        staged = "​";
        stashed = "≡";
        style = "cyan";
        untracked = "​";
      };
    };
    integrations.fish.enable = true;
    transience.enable = true;
  };
}
