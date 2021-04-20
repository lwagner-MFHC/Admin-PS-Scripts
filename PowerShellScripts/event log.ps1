.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -h eventvwr.exe
Read-Host -Prompt “Press Enter to exit”