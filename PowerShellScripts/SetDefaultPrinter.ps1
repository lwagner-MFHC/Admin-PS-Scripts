$Printer = Read-Host "Enter Desired Pritner Name"
$Machine = Read-Host "Enter Target Computer Name"
$Domain = Read-Host "Enter relevant domain for user logon"
$Username = Read-Host "Enter username with required privileges for command execution" 
Invoke-Command -ComputerName $Machine -Credential <domain>\<username to run command as> -ScriptBlock {
     CScript C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs -t -p $Printer
     }

Read-Host -Prompt “Press Enter to exit”
