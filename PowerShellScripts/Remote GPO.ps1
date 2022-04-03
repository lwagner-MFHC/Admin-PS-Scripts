$Machine = Read-Host "Enter Target Computer Name"
gpedit.msc /gpcomputer: $Machine
