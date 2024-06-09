#################
# eza
#################

alias ls="eza --icons"

################
# welcome
################

switch (uname)
case Linux
    screenfetch
end

# Suppress welcome message
set fish_greeting

################
# starship
################

starship init fish | source
