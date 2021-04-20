.$profile
$Machine = Read-Host "Enter Target Computer Name"
$Date = Get-Date -UFormat "%A %m-%d-%Y"
$FileName = "$Machine($Date).csv"
.$psexec \\$Machine -u $u -p $p -h pwsh -command "& \\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\InstalledSoftwareCallingScript.ps1"
start "\\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\csv installed application reports\$Machine.xlsx"