.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p -h devmgmt.msc 
Read-Host -Prompt “Press Enter to exit”