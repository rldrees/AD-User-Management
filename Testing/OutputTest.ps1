$logFile = "C:\Scripts\PS_with_GUI\Testing\MyLog.txt"

function Write-Log ([string] $message)
{
    Add-Content -Path $logFile -Value $message
}

Write-Log "Username: $UserName   "
Write-Log "Password: $pass   "
Write-Log "FirstName: $FirstName   "
Write-Log "LastName: $LastName   "
Write-Log "Location: $Location   "
Write-Log "Job: $Job   "
Write-Log "Manager: $Manager   "