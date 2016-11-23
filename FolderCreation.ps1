# My original code for the new User creation
$FolderPath = ("\\c3p0.powerdrives.local\g$\User_Data_Files\" + $Location + "\" + $UserName + "\" + $UserName)
$FolderPathD = ("\\c3p0.powerdrives.local\g$\User_Data_Files\" + $Location + "\" + $UserName + "\" + $UserName + "Desktop")
$FolderPathF = ("\\c3p0.powerdrives.local\g$\User_Data_Files\" + $Location + "\" + $UserName + "\" + $UserName + "F")
$FolderPathP = ("\\c3p0.powerdrives.local\g$\User_Data_Files\" + $Location + "\" + $UserName + "\" + $UserName + "P")
$FolderPathTop = ("\\c3p0.powerdrives.local\g$\User_Data_Files\" + $Location + "\" + $UserName)
$FolderPathRemote = ("g:\User_Data_Files\" + $Location + "\" + $UserName + "\" + $UserName)
$FolderPathRemoteD = ("g:\User_Data_Files\" + $Location + "\" + $UserName + "\" + $UserName + "Desktop")
$FolderPathRemoteF = ("g:\User_Data_Files\" + $Location + "\" + $UserName + "\" + $UserName + "F")
$FolderPathRemoteP = ("g:\User_Data_Files\" + $Location + "\" + $UserName + "\" + $UserName + "P")
$DomainUserName = New-Object System.security.principal.NTAccount("powerdrives.local\" + $UserName)
$FullControl = New-Object -TypeName system.security.accesscontrol.filesystemaccessrule -ArgumentList ($DomainUserName,"FullControl","ContainerInherit,ObjectInherit", "None","Allow")
$ShareDoc = $UserName + "$"
$ShareDesk = $UserName + "Desktop$"
$ShareFav = $UserName + "F$"
$SharePic = $UserName + "P$"

#creating the home directory before pointing to it in the next step
md  $FolderPath
md $FolderPathF
md $FolderPathP
md $FolderPathD

#Setting Permissions for the folders now that the user has been created
$ACL = Get-ACL $FolderPathTop
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPathTop $ACL
$ACL = Get-ACL $FolderPath
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPath $ACL
$ACL = Get-ACL $FolderPathD
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPathD $ACL
$ACL = Get-ACL $FolderPathF
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPathF $ACL
$ACL = Get-ACL $FolderPathP
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPathP $ACL

#Setting up Shared folders and shared permissions

Invoke-Command -ComputerName C3P0 -ScriptBlock { Param($ShareDoc,$ShareDesk,$ShareFav,$SharePic,$FolderPathRemote,$FolderPathRemoteD,$FolderPathRemoteF,$FolderPathRemoteP
)New-SmbShare -Name $ShareDoc -FullAccess Everyone -Path $FolderPathRemote
New-SmbShare -Name $ShareDesk -FullAccess Everyone -Path $FolderPathRemoteD
New-SmbShare -Name $ShareFav -FullAccess Everyone -Path $FolderPathRemoteF
New-SmbShare -Name $SharePic -FullAccess Everyone -Path $FolderPathRemoteP} -ArgumentList $ShareDoc,$ShareDesk,$ShareFav,$SharePic,$FolderPathRemote,$FolderPathRemoteD,$FolderPathRemoteF,$FolderPathRemoteP


#Setting permissions again, just to be sure
$ACL = Get-ACL $FolderPathTop
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPathTop $ACL
$ACL = Get-ACL $FolderPath
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPath $ACL
$ACL = Get-ACL $FolderPathD
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPathD $ACL
$ACL = Get-ACL $FolderPathF
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPathF $ACL
$ACL = Get-ACL $FolderPathP
$ACL.SetOwner($DomainUserName)
$ACL.SetAccessRule($FullControl)
set-acl $FolderPathP $ACL