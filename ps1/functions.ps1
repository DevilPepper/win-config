function togglePowerline() {
    $env:supports_powerline = $env:supports_powerline -xor $TRUE
    [Environment]::SetEnvironmentVariable("supports_powerline", $env:supports_powerline, [System.EnvironmentVariableTarget]::User)
}

# Enters Developer Powershell provided by Visual Studio
function dev() {
    $MSVS = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community"
    Import-Module $MSVS\Common7\Tools\Microsoft.VisualStudio.DevShell.dll
    Enter-VsDevShell -SkipAutomaticLocation -SetDefaultWindowTitle -InstallPath $MSVS
}