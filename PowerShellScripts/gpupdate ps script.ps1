function Deploy-GPUpdate {
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
        $TechPC = HOSTNAME.EXE
        Write-Host "Deploying GPUpdate to specified PCs ($ComputerName). Deployment starting from Technician Workstation $TechPC `n"
    }
    
    process {
        foreach ($c in $ComputerName) {
            Write-Host "GPUpdate process starting on $c ..."
            Invoke-Command -ComputerName $c -ScriptBlock {
                gpupdate /force
            }
            Write-Host "GPUpdate finished for $c! Addressing next target... `n"
        }
    }
    
    end {
        Get-PSSession | Remove-PSSession
        Read-Host "GPUpdate process finsished for targets $ComputerName. Press Enter to exit."
    }
}