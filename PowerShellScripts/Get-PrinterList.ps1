Install-Module ImportExcel -Force
Import-Module ImportExcel
$Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"
Get-Printer | Select-Object -Property Name, PrinterStatus, DriverName, PortName | Export-Excel -Path "\\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\Csv_Current_Printers\$Env:Computername.xlsx" -AutoSize -TableName "$Env:Computername_Printers" -WorksheetName "$Date"