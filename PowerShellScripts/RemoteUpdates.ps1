.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -h pwsh -command "Import-Module Bitlocker; Suspend-BitLocker -MountPoint 'C:' -RebootCount 1"
.$psexec \\$Machine -u $u -p $p -h pwsh -command "Install-Module PSWindowsUpdate -Force; Import-Module PSWindowsUpdate; Install-WindowsUpdate -WindowsUpdate -AcceptAll -IgnoreReboot"
.$psexec \\$Machine -u $u -p $p -h cmd /c "USOClient.exe RestartDevice"
Read-Host -Prompt “Press Enter to exit”