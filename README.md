I wasn't entirely sure what was required of me for this code sample, so I figured I would just show
what I have been working on at my current position. This code uses a combination of C# using WPF in Visual
Studio and a powershell backbone to do the heavy lifting on the Active Directory and file management
side of things. I designed the powershell scripts about a year ago, and have just recently begun creating a
GUI to control it so there is no need to go into the powershell command line.

In order to ensure the program runs properly, you will have to make a modification to your powershell
Execution Policy. By default it is set to block outside powershell scripts. You will need to open both the
64 bit ( C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe ) and the 32 bit ( 
C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe ) as an admin and type "Set-ExecutionPolicy Unrestricted"

If you have further questions, do not hesitate to contact me.