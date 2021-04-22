function Enable-Scripts {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String[]]
        $ComputerName
    )
    foreach ($c in $ComputerName) {
        Invoke-Command -ComputerName $c -ScriptBlock {
            HOSTNAME.EXE
            Set-ExecutionPolicy unrestricted
            Write-Host "PowerShell Scripts Now Enabled!"
        }
    }
    Read-Host -Prompt “Press Enter to exit”
}