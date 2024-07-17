# Define variables
$code = '4/0AcvDMrDYK1gOcBbgNgMSvkbVmiwQi6ul0k-lcGbxUdBqa1VE4ihERPosb-QjqqOFc7mNYg'
$name = 'Kiara Laptop'

# Download the Chrome Remote Desktop Host MSI
Invoke-WebRequest https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi -OutFile chromeremotedesktophost.msi
Start-Process msiexec.exe -ArgumentList '/i chromeremotedesktophost.msi /quiet /norestart' -Wait

# Start the Chrome Remote Desktop Host with the provided code and name
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command & {& '${Env:PROGRAMFILES(X86)}\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe' --code='$code' --redirect-url='https://remotedesktop.google.com/_/oauthredirect' --name='$name'}"

# Wait for the process to start
Start-Sleep -Seconds 5

# Simulate keystrokes to enter the PIN
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("123456")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("123456")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")