.$profile
$Machine = Read-Host "Enter Target Computer Name"
$Printer = Read-Host "Enter Path of Desired Printer Name"
.$psexec \\$Machine -u $u -p $p -h powershell -command "Remove-Printer -Name '$printer'; Get-Printer"
Read-Host -Prompt “Press Enter to exit”