.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p -h cmd /c "call \\mfhc-fs01\Share\IT\MISWIM\newversions\InstallTSScanClient.bat"
Read-Host -Prompt “Press Enter to exit”