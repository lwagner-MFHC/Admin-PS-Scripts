Import-Module ImportExcel
$Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"
$FolderName = "<path to folder to generate file hashes for>"

Get-ChildItem -Path '$FolderName' -Recurse -File | Get-FileHash  | Export-Excel -Path "<path to folder for output file>\$FolderName Folder FileHashes.xlsx" -AutoSize -TableName "$TableDate" -WorksheetName "$Date" -BoldTopRow -FreezeTopRow -Show
