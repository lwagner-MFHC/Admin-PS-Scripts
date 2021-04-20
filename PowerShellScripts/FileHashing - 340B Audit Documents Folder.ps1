Import-Module ImportExcel
$Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"

Get-ChildItem -Path "\\mfhc-fs01\Share\340B Audit Documents" -Recurse -File | Get-FileHash  | Export-Excel -Path "\\mfhc-fs01\Users\lwagner.MFHC\lwagner\Auditing\340B Audit Documents Folder\340B Audit Documents Folder FileHashes.xlsx" -AutoSize -TableName "$Date" -WorksheetName "$Date" -BoldTopRow -FreezeTopRow -Show