# workaround to fix some quirks with starship transience on fish
function starship_transient_prompt_func
    tput cuu1
    starship module character
end

function prompt_newline --on-event fish_postexec
    echo
end

alias clear "command clear; commandline -f clear-screen"
