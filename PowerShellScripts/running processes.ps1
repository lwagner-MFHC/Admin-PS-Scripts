$Machine = Read-Host "Enter Target Computer Name"
$Domain = Read-Host "Enter relevant domain for user logon"
$Username = Read-Host "Enter username with required privileges for command execution" 
Invoke-Command -ComputerName $Machine -Credential <domain>\<username to run command as> -ScriptBlock {
     Install-Module ImportExcel -Force
     Import-Module ImportExcel
     $Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"
     $Computername = Get-ChildItem Env:Computername
     $FileName = "$env:computername.xlsx"
     cd <path to desired output folder>; Get-Process; Get-Process | Export-Excel -Path "<path to desired output folder>\$FileName" -AutoSize -TableName $Env:Computername_Processes -WorksheetName "$Date"
     }
exit 
