function Deploy-EdgeHome {
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
        HOSTNAME.EXE
        Write-Host "Staging changes, please wait..."
    }
    
    process {
        foreach ($c in $ComputerName) {
            Invoke-Command -ComputerName $c -ScriptBlock {
                $registryPath = 'HKLM:\Software\Policies\Microsoft\Edge'

                $name = 'RestoreOnStartup'

                $value = 0x00000004

                IF (!(Test-Path $registryPath)) {

                    New-Item -Path $registryPath -Force | Out-Null

                    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
                }

                ELSE {

                    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
                }
            }

            Invoke-Command -ComputerName $c -ScriptBlock {
                New-Item -Path HKLM:\Software\Policies\Microsoft\Edge -Name RestoreOnStartupURLs –Force

                $path = 'HKCU:\Software\Policies\Microsoft\Edge\RestoreOnStartupURLs'

                $name = '1'

                $value = 'https://mfhc.sharepoint.com/'

                Set-Itemproperty -Path $path -Name $name -Value $value
            }
        }
    }
    
    end {
        Get-PSSession | Remove-PSSession
    }
}