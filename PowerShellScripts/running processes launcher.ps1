.$profile
$psexec = "\\mfhc-fs01\Share\IT\Useful_Tools\PSTools\PsExec64.exe"
$Machine = Read-Host "Enter Target Computer Name"
$Date = Get-Date -UFormat "%A %m-%d-%Y"
$FileName = "$Machine($Date).csv"
.$psexec \\$Machine -u $u -p $p -h pwsh -command "& '\\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\running processes.ps1'" 


Read-Host -Prompt “Press Enter to exit” 