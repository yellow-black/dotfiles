Invoke-Expression (&starship init powershell)
fastfetch

function eza-icons {
    eza --icons $args
}

Set-Alias -Name ls -Value eza-icons

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })