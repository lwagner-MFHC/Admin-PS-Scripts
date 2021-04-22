function Enable-WMI {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String[]]
        $ComputerName
    )
    foreach ($c in $ComputerName) {
        Invoke-Command -ComputerName $c -ScriptBlock {
            hostname
            netsh advfirewall firewall set rule group="windows management instrumentation (wmi)" new enable=yes
            Write-Host "WMI is now Enabled"
        }
    }
    Read-Host -Prompt “Press Enter to exit”

}
