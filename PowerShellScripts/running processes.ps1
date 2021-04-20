Install-Module ImportExcel -Force
Import-Module ImportExcel
$Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"
$Computername = Get-ChildItem Env:Computername
$FileName = "$env:computername.xlsx"
cd \\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\csv_running_processes_reports; Get-Process; Get-Process | Export-Excel -Path "\\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\csv_running_processes_reports\$FileName" -AutoSize -TableName $Env:Computername_Processes -WorksheetName "$Date"

exit 