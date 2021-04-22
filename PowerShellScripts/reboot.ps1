function Deploy-Reboot {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'Parameter Set 1')]
        [String[]]
        $ComputerName
    )
    
    begin {
        $TechPC
        Write-Host "Rebooting target PCs. Reboots initiated from Technician Workstation $TechPC. `n"
    }
    
    process {
        foreach ($c in $ComputerName) {
            Write-Host "Suspending BitLocker on $c"
            Invoke-Command -Computername $c -ScriptBlock {
                Import-Module Bitlocker; Suspend-BitLocker -MountPoint 'C:' -RebootCount 1
            }
            Write-Host "Bitlocker suspended on $c. BitLocker will automatically resume after reboot."
            Invoke-Command -Computername $c -ScriptBlock {
                shutdown /r /f /t 0
            }
            Write-Host "Process finished, $c is now rebooting. Moving to next target. `n"
        }
    }
    
    end {
        Read-Host "No additional targets remaining. Script complete! Press Enter to exit:"
    }
}