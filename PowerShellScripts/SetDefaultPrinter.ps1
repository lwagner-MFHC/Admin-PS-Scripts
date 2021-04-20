.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p powershell -command "Get-Printer"
$Printer = Read-Host "Enter Desired Pritner Name"
.$psexec \\$Machine -u $u -p $p cmd /c "CScript C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs -t -p $Printer"

Read-Host -Prompt “Press Enter to exit”