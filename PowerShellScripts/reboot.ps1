.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -h pwsh -command "Import-Module Bitlocker; Suspend-BitLocker -MountPoint 'C:' -RebootCount 1"
.$psexec \\$Machine -h cmd /C "shutdown /r /f /t 0"

exit