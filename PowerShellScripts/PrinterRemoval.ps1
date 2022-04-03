$Printer = Read-Host "Enter Target Printer Name"
$Machine = Read-Host "Enter Target Computer Name"
$Domain = Read-Host "Enter relevant domain for user logon"
$Username = Read-Host "Enter username with required privileges for command execution" 
Invoke-Command -ComputerName $Machine -Credential <domain>\<username to run command as> -ScriptBlock {
     Remove-Printer -Name '<print server>\$printer'
     }
Read-Host -Prompt “Press Enter to exit”
