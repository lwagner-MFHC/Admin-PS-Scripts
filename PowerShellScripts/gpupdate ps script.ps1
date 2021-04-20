$Machine = Read-Host "Enter Target Computer Name"
.\psexec \\$Machine -h cmd /C "gpupdate /force"

Read-Host -Prompt "Press Enter to Exit."
