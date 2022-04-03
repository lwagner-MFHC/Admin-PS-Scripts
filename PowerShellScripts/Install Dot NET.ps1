$Machine = Read-Host "Enter Target Computer Name"

Invoke-Command -ComputerName $Machine -Credential <domain>\<username to run command as> -ScriptBlock {<path to Dot Net installer>\ndp48-x86-x64-allos-enu.exe /q /norestart}

Read-Host -Prompt “Press Enter to exit”
