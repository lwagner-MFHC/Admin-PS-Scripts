.$profile
$Machine = Read-Host "Enter Target Computer Name"
.$psexec \\$Machine -i -u $u -p $p -h cmd /C "call \\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\ScreenScaling100.bat"
Read-Host -Prompt "Press Enter to Exit"