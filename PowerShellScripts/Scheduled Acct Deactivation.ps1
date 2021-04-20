$user = Read-Host “Enter Username of Employee Being Terminated”
$date = Read-Host "Please Enter Scheduled Term Date (MM/DD/YYYY)" 
Set-ADAccountExpiration -Identity $user -DateTime "$date 6:00 PM"
Read-Host -Prompt "Press Enter to exit"