#keepalive.ps1 (Powershell Script)

while ($true) {
    # send some command to RDP (change to correct command as needed)
    mstsc /v:$Env:COMPUTERNAME
    Start-Sleep -Seconds 300  # Sleep for 5 minutes
}
