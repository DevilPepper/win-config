Import-Module Get-ChildItemColor
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

function su()
{
    sudo powershell
}

function sudo($command) {
    Start-Process $command -Verb runAs
}

function which($command) {
    $(Get-Command $command).Source
}
