$DomainUserName = New-Object System.security.principal.NTAccount("powerdrives.local\" + $UserName)
$DenyControl = New-Object  system.security.accesscontrol.filesystemaccessrule($DomainUserName,"FullControl","ContainerInherit,ObjectInherit", "None","Deny")

#Zipping up old user files
write-zip ("\\VMUSERDATA1\f$\UserData\" + $Location + "\" + $UserName) ("\\VMUSERDATA1\f$\UserData\" + $Location + "\" + $UserName + ".zip")

#Moving Files from VMUserdata to NAS Data
Move-Item ("\\VMUSERDATA1\f$\UserData\" + $Location + "\" + $UserName + ".zip") "\\C3P0.powerdrives.local\e$\Termed User Folders\pst waiting area\"

#Remove old file location from VMUserdata
$ACL = Get-ACL ("\\VMUSERDATA1\f$\UserData\" + $Location + "\" + $UserName)
$ACL.SetAccessRule($DenyControl)
set-acl ("\\VMUSERDATA1\f$\UserData\" + $Location + "\" + $UserName) $ACL
Remove-Item ("\\VMUSERDATA1\f$\UserData\" + $Location + "\" + $UserName) -Recurse -Force