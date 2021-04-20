.$profile
$Machine = Read-Host "Enter Target Computer Name"


.$psexec \\$Machine -u $u -p $p -h powershell -command "Disable-WindowsOptionalFeature -FeatureName Internet-Explorer-Optional-amd64 –Online -NoRestart"

Read-Host -Prompt “Press Enter to exit”
