function Deploy-ChromeHomePage {
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
        $cred = Get-Credential
        $s = New-PSSession -ComputerName $ComputerName -Credential $cred
        Invoke-Command -Session $s -ScriptBlock {
            #paths for chrome policy keys used in the scripts
            $policyexists = Test-Path HKLM:\SOFTWARE\Policies\Google\Chrome
            $policyexistshome = Test-Path HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs
            $regKeysetup = "HKLM:\SOFTWARE\Policies\Google\Chrome"
            $regKeyhome = "HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs"
            $url = "https://mfhc.sharepoint.com/"

            #setup policy dirs in registry if needed and set pwd manager
            #else sets them to the correct values if they exist
            if ($policyexists -eq $false) {
                New-Item -path HKLM:\SOFTWARE\Policies\Google
                New-Item -path HKLM:\SOFTWARE\Policies\Google\Chrome
                New-ItemProperty -path $regKeysetup -Name RestoreOnStartup -PropertyType Dword -Value 4
                New-ItemProperty -path $regKeysetup -Name HomepageLocation -PropertyType String -Value $url
            }

            Else {
                Set-ItemProperty -Path $regKeysetup -Name RestoreOnStartup -Value 4
                Set-ItemProperty -Path $regKeysetup -Name HomepageLocation -Value $url
            }

            #This entry requires a subfolder in the registry
            #For more then one page create another new-item and set-item line with the name -2 and the new url
            if ($policyexistshome -eq $false) {
                New-Item -path HKLM:\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs
                New-ItemProperty -path $regKeyhome -Name 1 -PropertyType String -Value $url
            }
            Else {
                Set-ItemProperty -Path $regKeyhome -Name 1 -Value $url
            }
        }
    }
    
    end {
        Get-PSSession | Remove-PSSession
    }
}