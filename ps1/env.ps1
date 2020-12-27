$shell = $Host.UI.RawUI

$shell.BackgroundColor = "Black"
$shell.ForegroundColor = "White"

#fix git log and possibly other stuff
$env:term = "xterm"

$env:PSModulePath += ";$home\win-config\modules"

Import-Module PSReadLine

Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000
Set-PSReadlineOption -BellStyle None
# history substring search
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function MenuComplete
Set-PSReadlineKeyHandler -Key Tab -Function Complete

$PL_fire=[char]0xe0c0
$PL_lego=[char]0xe0ce
$PL_graph=[char]0xe0c8
$PL_digitize=[char]0xe0c6
$PL_Triangle=[char]0xe0b0
$PL_Round=[char]0xe0b4
$PL_Hex=[char]0xe0cc
$floating_ghost=[char]0xe007

$prompt_separator = "$PL_digitize "
$final_separator = "$prompt_separator"

$git_char = [char]0xe0a0
