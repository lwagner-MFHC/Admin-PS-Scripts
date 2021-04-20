.$profile
$Machine = Read-Host "Enter Target Computer Name"


.$psexec \\$Machine -u $u -p $p -h powershell -command "& \\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\Get-PrinterList.ps1"

Read-Host -Prompt “Press Enter to exit”
