$User1 = Read-Host -Prompt 'Enter the username of the employee you wish to change'

Get-ADUser -Identity $User1 -Properties MemberOf | ForEach-Object {
  $_.MemberOf | Remove-ADGroupMember -Members $_.DistinguishedName -Confirm:$false
}