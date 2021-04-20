cd "\\mfhc-fs01\Share\IT\Useful_Tools\PSTools\Scripts\csv installed application reports"; Get-Process | Export-Csv '$FileName'; Import-Csv '$FileName' | Select-Object -Property Name, Id, Path | Format-Table *

exit 