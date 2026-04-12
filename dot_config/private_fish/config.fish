set -gx EDITOR nvim
set -gx VISUAL nvim

if not status is-interactive
    return
end

fish_config theme choose catppuccin-mocha --color-theme=dark

abbr -a n nvim
abbr -a nv nvim
abbr -a nvi nvim
abbr -a v nvim
abbr -a vi nvim
abbr -a vim nvim

abbr -a py python
abbr -a ipy ipython

abbr -a g git
abbr --command git co checkout
abbr --command git st status

abbr -a gs git status
abbr -a ga git add
abbr -a gc git commit
abbr -a gsw git switch
abbr -a gb git branch
abbr -a gp git push
abbr -a gl 'git log --oneline --graph --decorate'
abbr -a gd git diff

abbr -a cz chezmoi
abbr --command chezmoi a add
abbr -a cza chezmoi add
abbr -a czc chezmoi cd
abbr -a cze chezmoi edit

abbr -a j just

abbr -a ff fastfetch

alias fd="fdfind"
alias ls="eza --icons"
alias lt="eza --icons --tree"
alias cat="batcat"
alias bat="batcat"
alias lg="lazygit"

# WSL 向けの設定
if set -q WSL_INTEROP
    set -gx WINHOME (wslpath (powershell.exe -NoProfile "\$env:USERPROFILE" | string trim))

    abbr -a win "cd $WINHOME"
    abbr -a downloads "cd $WINHOME/Downloads"

    function o --description 'Open a file or directory with the default Windows application'
        if not set -q argv[1]
            echo "Usage: o <file-or-directory>"
            return 1
        end
        set -l path (wslpath -w (realpath $argv[1]))
        powershell.exe -NoProfile "Start-Process '$path'"
    end
end

# fish_vi_key_bindings

abbr -a zj zellij
if set -q ZELLIJ
else
    zellij
end
