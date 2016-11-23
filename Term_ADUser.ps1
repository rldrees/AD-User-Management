#Script to disable a user in AD and move them to Termed Users with removed phone
Get-ADUser $UserName | Move-ADObject -TargetPath "OU=Termed Personnel With Removed Phone,DC=powerdrives,DC=local"
Disable-ADAccount -Identity $UserName
