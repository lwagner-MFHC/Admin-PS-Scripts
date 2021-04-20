$Machine = Read-Host -Prompt "Target PC"
cmd /c "gpedit.msc /gpcomputer: $Machine"