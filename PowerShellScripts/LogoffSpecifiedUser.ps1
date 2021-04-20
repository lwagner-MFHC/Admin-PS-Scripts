
<#
.Synopsis
Queries a computer to check for interactive sessions and logs out users

.DESCRIPTION
This script takes the output from the quser program and parses this to PowerShell objects

.NOTES   
Modified from original source - https://gallery.technet.microsoft.com/scriptcenter/Get-LoggedOnUser-Gathers-7cbe93ea

.PARAMETER ComputerName
The string or array of string for which a query will be executed

.EXAMPLE
.\Remove-LoggedOffUser.ps1 -ComputerName server01,server02

Description:
This will remotely log out disconnected users from specified computers
#>
param(
	[CmdletBinding()]
	[Parameter(ValueFromPipeline = $true,
			   ValueFromPipelineByPropertyName = $true)])
begin{
	$ErrorActionPreference = 'Stop'
}

process {
	foreach ($Computer in $ComputerName) {
		try {
			quser /Server:$ComputerName | Select-Object -Skip 1 | ForEach-Object {
				$CurrentLine = $_.Trim() -Replace '\s+', ' ' -Split '\s'
				$UserName = $CurrentLine[0]
				$UserID = $CurrentLine[1]
				$UserActivity = $CurrentLine[2]
				
				# If session is disconnected, all processes will be closed and the user logged out
				if ($UserActivity -match 'Disc') {
					Get-Process | Select -Property ID, SessionID | Where-Object { $_.SessionID -eq $UserID } | ForEach-Object { Stop-Process -ID $_.ID -Force -ErrorAction SilentlyContinue }
					Write-Warning "Logging off user $UserName"
					Logoff $UserID
				}
			}
		}
		catch {
			Write-Warning "Error occured - $($_.Exception.Message)"
		}
	}
}