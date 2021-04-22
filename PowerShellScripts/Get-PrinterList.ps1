function Get-InstalledPrinters {
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
        Import-Module ImportExcel
        Write-Host "Import-Excel Loaded"
        $Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"
        Write-Host "Date parameter set to: $Date `n"
    }
    
    process {
        foreach ($c in $ComputerName) {
            $c
            Write-Host "Gathering Printers"
            Invoke-Command -ComputerName $c -ScriptBlock {
                Get-Printer | Select-Object -Property Name, PrinterStatus, DriverName, PortName
            } | Export-Excel -Path "\\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\Csv_Current_Printers\$c.xlsx" -AutoSize -TableName "$c_Printers" -WorksheetName "$Date"
            Write-Host "Printers gathered, moving on. `n"
        }
    }
    
    end {
        Get-PSSession | Remove-PSSession
        Read-Host "Script Completed! Press Enter to exit."
    }
}