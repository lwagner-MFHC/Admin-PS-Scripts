$Machine = Read-Host "Enter Target Computer Name"
$Domain = Read-Host "Enter relevant domain for user logon"
$Username = Read-Host "Enter username with required privileges for command execution" 

Invoke-Command -ComputerName $Machine -Credential <domain>\<username to run command as> -ScriptBlock {
     Disable-WindowsOptionalFeature -FeatureName Internet-Explorer-Optional-amd64 –Online -NoRestart
     }

Read-Host -Prompt “Press Enter to exit”
