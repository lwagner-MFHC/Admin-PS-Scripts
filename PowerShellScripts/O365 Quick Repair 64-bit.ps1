$Machine = Read-Host "Enter Target Computer Name"
$Domain = Read-Host "Enter relevant domain for user logon"
$Username = Read-Host "Enter username with required privileges for command execution" 

Invoke-Command -ComputerName $Machine -Credential <domain>\<username to run command as> -ScriptBlock { 
     cd 'C:\Program Files\Microsoft Office 15\ClientX64\' 
     .\OfficeClickToRun.exe scenario=Repair DisplayLevel=false RepairType=QuickRepair forceappshutdown=true
     }

Read-Host -Prompt “Press Enter to exit”
