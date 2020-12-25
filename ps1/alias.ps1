Import-Module Get-ChildItemColor
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

function start-arch-vm(){
    VBoxManage startvm "Arch"
}

function su()
{
    Start-Process powershell -Verb runAs
}

Set-Alias arch start-arch-vm