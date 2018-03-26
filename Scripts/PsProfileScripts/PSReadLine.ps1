Set-PSReadLineOption -HistorySearchCursorMovesToEnd

Set-PSReadlineKeyHandler -Key "Ctrl+Delete"       -Function "KillWord"
Set-PSReadlineKeyHandler -Key "Ctrl+Backspace"    -Function "BackwardKillWord"
Set-PSReadlineKeyHandler -Key "Shift+Backspace"   -Function "BackwardKillWord"
Set-PSReadlineKeyHandler -Key "UpArrow"           -Function "HistorySearchBackward"
Set-PSReadlineKeyHandler -Key "DownArrow"         -Function "HistorySearchForward"
Set-PSReadlineKeyHandler -Key "Tab"               -Function "Complete"
Set-PSReadlineKeyHandler -Key "Ctrl+Q"            -Function "TabCompleteNext"
Set-PSReadlineKeyHandler -Key "Ctrl+Shift+Q"      -Function "TabCompletePrevious"