Import-Module ImportExcel
$Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"
$FolderName = "Board of Directors"

Get-ChildItem -Path "\\mfhc-fs01\Share\$FolderName" -Recurse -File | Get-FileHash  | Export-Excel -Path "\\mfhc-fs01\Users\lwagner.MFHC\lwagner\Auditing\$FolderName Folder\$FolderName Folder FileHashes.xlsx" -AutoSize -TableName "$TableDate" -WorksheetName "$Date" -BoldTopRow -FreezeTopRow -Show