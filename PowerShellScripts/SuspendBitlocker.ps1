.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p -h powershell -command "Import-Module Bitlocker; Suspend-BitLocker -MountPoint 'C:' -RebootCount 5"

Read-Host -Prompt "Press Enter to exit"