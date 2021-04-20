.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p -h powershell -command "query session /server:$c"
Read-Host -Prompt “Press Enter to exit”