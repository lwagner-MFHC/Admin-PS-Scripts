.$profile
$Machine = Read-Host "Enter Target Computer Name"
$Printer = Read-Host "Enter Path of Desired Printer Name"
.$psexec \\$Machine -u $u -p $p -h powershell -command "Add-Printer -ConnectionName $Printer; Get-Printer"
Read-Host -Prompt “Press Enter to exit”