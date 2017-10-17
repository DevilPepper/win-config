$shell = $Host.UI.RawUI

$shell.BackgroundColor = "Black"
$shell.ForegroundColor = "White"

#fix git log and possibly other stuff
$env:term = "xterm"

Import-Module PSReadLine

Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000
# history substring search
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function MenuComplete
Set-PSReadlineKeyHandler -Key Tab -Function Complete