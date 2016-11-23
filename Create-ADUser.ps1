#setting the User location/path in AD based on their location

switch ($Location)
 {
  "Buffalo"{$path = "OU=Office,OU=Users 801 Exchange,OU=UserGroupUSA,DC=powerdrives,DC=local"}
  "Erie" {$path = "OU=Erie Users to C3P0,OU=Users Erie,OU=UserGroupUSA,DC=powerdrives,DC=local"}
  "Falconer" {$path = "OU=Falconer Users Files on the .1.183 File Server,OU=Users Falconer,OU=UserGroupUSA,DC=powerdrives,DC=local"}
  "Pittsburgh" {$path = "OU=Users Pittsburgh,OU=UserGroupUSA,DC=powerdrives,DC=local"} 
  "Rochester" {$path = "OU=Rochester Users Files on the Buffalo File Server,OU=Users Rochester,OU=UserGroupUSA,DC=powerdrives,DC=local"}  
  "Tonawanda" {$path = "OU=Tonawanda Users Files on the Buffalo File Server,OU=Users Falconer,OU=UserGroupUSA,DC=powerdrives,DC=local"}
  "Columbus" {$path = "OU=Columbus Users Files on the Buffalo File Server,OU=Users Columbus,OU=UserGroupUSA,DC=powerdrives,DC=local"}
   default {"Could not determine Location"} 
 }

 $pass = ConvertTo-SecureString "$pass" -AsPlainText -force

#Create an AD User with the parameters set above
New-ADUser -path $path -name $FullName -AccountPassword $pass -ChangePasswordAtLogon 0 -Company "Power Drives, Inc" -Department $Location -SamAccountName $UserName -Description $Job -DisplayName ($FirstName + " " + $LastName) -EmailAddress ($Username + "@powerdrives.com") -Enabled 1 -GivenName $FirstName -Manager $Manager -Office $Location -Organization "Power Drives, Inc." -PasswordNeverExpires 1 -HomeDirectory ("\\C3P0.powerdrives.local\" + $UserName + "$") -HomeDrive "H:" -Surname $LastName -Title $Job -OfficePhone $Phone `

#Change IP Phone number for User
Get-ADuser -Identity $UserName -Properties ipPhone | Set-ADuser -replace @{ipPhone=$Extension} `

#Setting UPN for some reason has to be separate
Get-ADUser -Identity $UserName -Properties userPrincipalName | foreach { Set-ADUser $_ -UserPrincipalName "$($UserName)@powerdrives.com"} `

#Adding User to Default Groups
Add-ADGroupMember -Identity "CN=PDI Remote Desktop,OU=Branch Security Groups,DC=Powerdrives,DC=local" -Members $UserName
Add-ADGroupMember -Identity "CN=PDI_ScreenSaver_15min_Lock,OU=Branch Security Groups,DC=Powerdrives,DC=local" -Members $UserName
