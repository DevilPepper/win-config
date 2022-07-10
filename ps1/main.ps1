. "~/win-config/ps1/csharp-loader.ps1"

. "~/win-config/ps1/env.ps1"
. "~/win-config/ps1/prompt.ps1"
. "~/win-config/ps1/cd.ps1"
# . "~/win-config/ps1/wfh.ps1"
. "~/win-config/ps1/alias.ps1"
. "~/win-config/ps1/functions.ps1"

# . "~/win-config/ps1/docker.ps1"

Clear-Host

[regex]$ms_pattern = "\s*Microsoft\s*"
$win_os = $ms_pattern.replace($(Get-CimInstance Win32_OperatingSystem).Caption, "", 1)
$win_version = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseId
$win_build = [System.Environment]::OSVersion.Version.Build

Write-Host "$win_os | $win_version | $win_build | $env:username@$env:computername" -ForegroundColor Gray
Write-Host "" -ForegroundColor White
