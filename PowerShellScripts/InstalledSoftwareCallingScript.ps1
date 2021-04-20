Install-Module ImportExcel -Force
Import-Module ImportExcel
$Date = Get-Date -UFormat "%a, %b %d, %Y Time %H.%M.%S"
$TableDate = Get-Date -UFormat "%a %b %d %Y Time %H%M%S"

& \\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\InstalledSoftware.ps1 | Export-Excel -Path "\\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\csv installed application reports\$Env:Computername.xlsx" -AutoSize -TableName "$TableDate" -WorksheetName "$Date" -BoldTopRow -FreezeTopRow

