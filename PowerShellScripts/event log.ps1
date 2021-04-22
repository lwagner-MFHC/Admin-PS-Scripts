function Get-EventViewer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String[]]
        $ComputerName
    )
    $s = New-PSSession -ComputerName $ComputerName
        Invoke-Command -Session $s -ScriptBlock {
            eventvwr.exe
        } 
    Get-PSSession | Remove-PSSession
    Read-Host -Prompt “Press Enter to exit”
}