$shell = $Host.UI.RawUI

$shell.BackgroundColor = "Black"
$shell.ForegroundColor = "White"

#fix git log and possibly other stuff
$env:term = "xterm"

#Tab completion like bash?
