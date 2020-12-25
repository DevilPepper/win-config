. "~/win-config/ps1/git-prompt.ps1"

#. "~/win-config/ps1/csharp-loader.ps1"
Load-CSharp("~/win-config/cs/flash.cs")

function prompt {
	$thisdir = $(Split-Path $PWD -Leaf)
	if($thisdir -ceq $(Split-Path $home -Leaf)){
		$thisdir = "~"
	}

	Write-Host "[" -NoNewLine -ForegroundColor White
	Write-Host $(Get-Date -uformat "%I:%M %p") -NoNewLine -ForegroundColor Red
	Write-Host "]" -NoNewLine -ForegroundColor White
	Write-Host $env:username -NoNewLine -ForegroundColor Blue
	Write-Host "@" -NoNewLine -ForegroundColor White
	Write-Host $env:computername -NoNewLine -ForegroundColor Blue
	Write-Host "`:" -NoNewLine -ForegroundColor White
	Write-Host $thisdir -NoNewLine -ForegroundColor Green
	git_prompt
	Write-Host "`$" -NoNewLine -ForegroundColor White
	
	$pwrsh = (Get-Process -id $PID).MainWindowHandle
	$null = [window]::FlashWindow($pwrsh,375,1)

	return " "
}
