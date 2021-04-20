function Get-Quser{
    param(
        [string]$Username,
        [Parameter(
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true
        )]
        [Alias('Name','Computer','Server')]
        [string]$ComputerName = $env:COMPUTERNAME,
        [switch]$Logoff
    )
    begin {
        $tmplt = @{
            ComputerName  = $null
            UserName      = $null
            SessionName   = $null
            SessionId     = $null
            State         = $null
            IdleTime      = $null
            LogonTime     = $null
            Error         = $null
        }
    }

    process {
        $hash = $tmplt.Clone()  # clear (gets an unused hash)
        $hash.ComputerName = $ComputerName
        try {
            quser /server:$Computer 2>&1 | 
                Select-Object -Skip 1 | 
                ForEach-Object {
                    $hash.ComputerName = $Computer
                    $hash.UserName = (-join $_[1 .. 20]).Trim()
                    $hash.SessionName = (-join $_[23 .. 37]).Trim()
                    $hash.SessionId = [int](-join $_[38 .. 44])
                    $hash.State = (-join $_[46 .. 53]).Trim()
                    $hash.IdleTime = [datetime](-join $_[54 .. 63]).Trim() - [datetime]::Today
                    $hash.LogonTime = [datetime](-join $_[65 .. ($_.Length - 1)])
                }
            } 
            catch {
                $hash.Error = $_
            }
            if($username){
                if($Username -eq $hash.Username){
                    if($Logoff){
                        Write-Warning "Logging off $($hash.Username) from $ComputerName"
                        #logoff $hash.SessionId /SERVER:$computer
                    }
                }
            }else{
                [pscustomobject]$hash
            }
            Remove-Variable hash
        }
}
Get-Quser -Username "Read-Host 'Enter Target Computer Name'" -Logoff