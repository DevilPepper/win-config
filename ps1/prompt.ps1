. "~/win-config/ps1/git-prompt.ps1"

#. "~/win-config/ps1/csharp-loader.ps1"
Load-CSharp("~/win-config/cs/flash.cs")

function prompt {
	$thisdir = $(Split-Path $PWD -Leaf)
	if($thisdir -ceq $(Split-Path $home -Leaf)){
		$thisdir = "~"
	}
	$branch = $(git_branch)

	if($env:supports_powerline -eq $True) {
		Write-Host "$([char]0xe0c3) " -NoNewLine -ForegroundColor Black
		Write-Host $(Get-Date -uformat "%I:%M %p") -NoNewLine -ForegroundColor DarkRed -BackgroundColor Black
		Write-Host "$PL_Fire " -NoNewLine -ForegroundColor Black -BackgroundColor DarkBlue
		
		# Write-Host "$prompt_separator" -NoNewLine -ForegroundColor Black -BackgroundColor Blue
		Write-Host $env:username -NoNewLine -BackgroundColor DarkBlue -ForegroundColor White
		Write-Host "@" -NoNewLine -BackgroundColor DarkBlue -ForegroundColor DarkMagenta
		Write-Host "$env:computername " -NoNewLine -BackgroundColor DarkBlue -ForegroundColor White
		Write-Host "$prompt_separator" -NoNewLine -ForegroundColor DarkBlue -BackgroundColor DarkGreen
		Write-Host "$thisdir " -NoNewLine -ForegroundColor White -BackgroundColor DarkGreen
		if($branch){
			git_prompt $branch
		} else {
        	Write-Host "$final_separator"  -NoNewLine -BackgroundColor Black -ForegroundColor DarkGreen
		}
		Write-Host "" -NoNewLine -ForegroundColor White -BackgroundColor Black
	} else {
		Write-Host " [" -NoNewLine -ForegroundColor White
		Write-Host $(Get-Date -uformat "%I:%M %p") -NoNewLine -ForegroundColor DarkRed
		Write-Host "]" -NoNewLine -ForegroundColor White
		Write-Host $env:username -NoNewLine -ForegroundColor DarkBlue
		Write-Host "@" -NoNewLine -ForegroundColor White
		Write-Host $env:computername -NoNewLine -ForegroundColor DarkBlue
		Write-Host "`:" -NoNewLine -ForegroundColor White
		Write-Host $thisdir -NoNewLine -ForegroundColor DarkGreen
		if($branch){
			git_prompt $branch
		}
		Write-Host "`$" -NoNewLine -ForegroundColor White
	}

	$pwrsh = (Get-Process -id $PID).MainWindowHandle
	$null = [window]::FlashWindow($pwrsh,375,1)

	return " "
}
