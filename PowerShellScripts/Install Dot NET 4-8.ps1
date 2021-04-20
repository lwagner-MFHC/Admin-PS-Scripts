.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p -h cmd /c "\\mfhc-fs01\Share\IT\MISWIM\newversions\ndp48-x86-x64-allos-enu.exe /q /norestart"
Read-Host -Prompt “Press Enter to exit”