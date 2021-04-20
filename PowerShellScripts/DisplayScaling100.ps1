cd 'HKCU:\Control Panel\Desktop'
Set-ItemProperty -Path . -Name LogPixels -Value 96
cmd.exe /c "shutdown /l /f"; exit