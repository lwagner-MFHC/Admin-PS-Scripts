.$profile
$Machine = Read-Host "Enter Target Computer Name"


.$psexec \\$Machine -u $u -p $p -h powershell -command "cd 'C:\Program Files\Microsoft Office 15\ClientX64\' ; .\OfficeClickToRun.exe scenario=Repair DisplayLevel=false RepairType=QuickRepair forceappshutdown=true"

Read-Host -Prompt “Press Enter to exit”