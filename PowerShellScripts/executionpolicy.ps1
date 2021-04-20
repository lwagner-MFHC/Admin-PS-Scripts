.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p -h powershell -command "Set-ExecutionPolicy unrestricted"

Read-Host -Prompt "Press Enter to exit"