#. "~/win-config/ps1/csharp-loader.ps1"
Load-CSharp("~/win-config/cs/flash.cs")

function prompt {
	if($env:supports_powerline -eq $True) {
		Write-Host "$($PL.digitize) " -NoNewLine -ForegroundColor DarkBlue
	} else {
	  Write-Host "✗" -NoNewLine -ForegroundColor DarkGreen
	}
	Write-Host "" -NoNewLine -ForegroundColor White

	$pwrsh = (Get-Process -id $PID).MainWindowHandle
	$null = [window]::FlashWindow($pwrsh,375,1)

	return " "
}
