set fish_greeting                                 # Supresses fish's intro message

alias ll='exa -l --color=always --group-directories-first'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash' # Very important alias

colorscript random

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
# Colorscheme: Tomorrow Night
set -U fish_color_normal normal
set -U fish_color_command b294bb
set -U fish_color_quote b5bd68
set -U fish_color_redirection 8abeb7
set -U fish_color_end b294bb
set -U fish_color_error cc6666
set -U fish_color_param 81a2be
set -U fish_color_comment f0c674
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 969896
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel --reverse
set -U fish_pager_color_prefix normal --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D
set -U fish_pager_color_selected_background --background=brblack
