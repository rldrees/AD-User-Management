$DomainUserName = New-Object System.security.principal.NTAccount("powerdrives.local\" + $UserName)
$DenyControl = New-Object  system.security.accesscontrol.filesystemaccessrule($DomainUserName,"FullControl","ContainerInherit,ObjectInherit", "None","Deny")

#Zipping up old user files
write-zip ("\\C3P0.powerdrives.local\g$\User_Data_Files" + $Location + "\" + $UserName) ("\\C3P0.powerdrives.local\g$\User_Data_Files" + $Location + "\" + $UserName + ".zip")

#Moving Files from VMUserdata to NAS Data
Move-Item ("\\C3P0.powerdrives.local\g$\User_Data_Files" + $Location + "\" + $UserName + ".zip") "\\C3P0.powerdrives.local\e$\Termed User Folders\pst waiting area\"

#Remove old file location from VMUserdata
$ACL = Get-ACL ("\\C3P0.powerdrives.local\g$\User_Data_Files" + $Location + "\" + $UserName)
$ACL.SetAccessRule($DenyControl)
set-acl ("\\C3P0.powerdrives.local\g$\User_Data_Files" + $Location + "\" + $UserName) $ACL
Remove-Item ("\\C3P0.powerdrives.local\g$\User_Data_Files" + $Location + "\" + $UserName) -Recurse -Force