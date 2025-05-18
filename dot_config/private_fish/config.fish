starship init fish | source

set -gx EDITOR code
set -gx VISUAL code

alias fd="fdfind"
alias ls="eza --icons"
alias cat="batcat"

zoxide init fish --cmd cd | source