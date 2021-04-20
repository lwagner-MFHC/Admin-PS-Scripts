.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p -h powershell -command "Resume-BitLocker -MountPoint 'C:'"

Read-Host -Prompt "Press Enter to exit"