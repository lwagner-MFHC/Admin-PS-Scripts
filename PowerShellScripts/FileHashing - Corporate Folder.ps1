Import-Module ImportExcel
$Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"
$TableDate = Get-Date -UFormat "%a, %b %d, %Y Time %H_%M_%S"
$Location = "Corporate"

Get-ChildItem -Path "\\mfhc-fs01\Share\$Location" -Recurse -File | Get-FileHash  | Export-Excel -Path "\\mfhc-fs01\Users\lwagner.MFHC\lwagner\Auditing\$Location Folder\$Location Folder FileHashes.xlsx" -AutoSize -TableName "$TableDate" -WorksheetName "$Date" -BoldTopRow -FreezeTopRow -Show