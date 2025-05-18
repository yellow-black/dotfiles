Invoke-Expression (&starship init powershell)
fastfetch

function eza-icons {
    eza --icons $args
}

Set-Alias --name ls --value eza-icons