# posh-git for git completers
Import-Module posh-git -ErrorAction SilentlyContinue

$themePath = "$env:POSH_THEMES_PATH\hans.theme.json"
if (Test-Path $themePath) {
    Set-PoshPrompt -Theme $themePath
} else {
    Set-PoshPrompt -Theme material
}


if (Get-Module PSReadLine) {
    
    $e = [char]0x1b
    Set-PSReadLineKeyHandler -Chord Alt+Enter -Function AddLine
    Set-PSReadLineOption -ContinuationPrompt "  " -PredictionSource History -Colors @{
        Operator = "$e[96m"
        Parameter = "$e[96m"
        InlinePrediction = "$e[38;5;15;48;5;99m"
    }

    # Autocompleteion for Arrow keys
    # Searching for commands with up/down arrow is really handy.  The
    # option "moves to end" is useful if you want the cursor at the end
    # of the line while cycling through history like it does w/o searching,
    # without that option, the cursor will remain at the position it was
    # when you used up arrow, which can be useful if you forget the exact
    # string you started the search on.
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

$DefaultUser = 'hansl'