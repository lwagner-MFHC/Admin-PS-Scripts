.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -u $u -p $p -h cmd /c "call \\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\EnableWMI.bat"
Read-Host -Prompt “Press Enter to exit”