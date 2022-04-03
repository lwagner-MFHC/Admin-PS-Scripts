$Machine = Read-Host "Enter Target Computer Name"
$Domain = Read-Host "Enter relevant domain for user logon"
$Username = Read-Host "Enter username with required privileges for command execution" 

Invoke-Command -ComputerName $Machine -Credential <domain>\<username to run command as> -ScriptBlock {
     Install-Module ImportExcel -Force
     Import-Module ImportExcel

     $paths=@(
       'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\',
       'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'
     )
     foreach($path in $paths){
       Get-ChildItem -Path $path | 
         Get-ItemProperty | 
           Select DisplayName, Publisher, InstallDate, DisplayVersion, UninstallString 
     } | Export-Excel -Path "<path to folder for script output>\$Env:Computername.xlsx" -AutoSize -TableName "$Env:Computername_Software" -WorksheetName "$Date" -BoldTopRow -FreezeTopRow -Show
}
