set -gx EDITOR nvim
set -gx VISUAL nvim

abbr -a v nvim
abbr -a vi nvim
abbr -a vim nvim

abbr -a py python
abbr -a ipy ipython

abbr -a g git
abbr -a gs git status
abbr -a ga git add
abbr -a gc git commit
abbr -a gsw git switch
abbr -a gb git branch
abbr -a gp git push
abbr -a gl 'git log --oneline --graph --decorate'
abbr -a gd git diff

alias fd="fdfind"
alias ls="eza --icons"
alias cat="batcat"
alias lg="lazygit"

fish_vi_key_bindings

if set -q ZELLIJ
else
    if status is-interactive
        zellij
    end
end
