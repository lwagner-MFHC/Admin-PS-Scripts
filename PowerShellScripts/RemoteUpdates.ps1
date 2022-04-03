$Machine = Read-Host "Enter Target Computer Name"
$Domain = Read-Host "Enter relevant domain for user logon"
$Username = Read-Host "Enter username with required privileges for command execution" 
Invoke-Command -ComputerName $Machine -Credential <domain>\<username to run command as> -ScriptBlock {
     Import-Module Bitlocker; Suspend-BitLocker -MountPoint 'C:' -RebootCount 1
     Install-Module PSWindowsUpdate -Force; Import-Module PSWindowsUpdate; Install-WindowsUpdate -WindowsUpdate -AcceptAll -IgnoreReboot
     <# USOClient.exe RestartDevice #>
     }
Read-Host -Prompt “Press Enter to exit”
