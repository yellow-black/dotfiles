#################
# macOS 
#################

switch (uname)
case Darwin
    eval (/opt/homebrew/bin/brew shellenv)
end

#################
# alias 
#################

alias ls="eza --icons"

################
# starship
################

starship init fish | source
