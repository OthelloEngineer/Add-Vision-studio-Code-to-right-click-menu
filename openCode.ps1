Write-Output "Installing ps2exe for converting future script to .exe"
Install-Module -Name ps2exe
Write-Output "Installing ps2exe complete"

Write-Output "Making Directory: C:\openVisualCode"
New-Item -Path "c:\" -Name "openVisualCode" -ItemType "directory"
Write-Output "Making Directory: C:\openVisualCode complete"

Write-Output "Creating file script.ps1 at Directory: C:\openVisualCode"
New-Item C:\openVisualCode\script.ps1
Write-Output "Creating file script.ps1 at Directory: C:\openVisualCode Complete"

Write-Output "Setting content of file: C:\openVisualCode\script.ps1"
Set-Content C:\openVisualCode\script.ps1 "code ."
Write-Output "Setting content complete"

Write-Output "Converting powershell script to executable"
Invoke-ps2exe C:\openVisualCode\script.ps1
Write-Output "Convertion complete"

Write-Output "Creating registry directory Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\testingcode"
New-Item -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VisualStudioCode
Write-Output "Creating Registry Directory complete"

Write-Output "Adding Command directory"
New-Item -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VisualStudioCode\Command
Write-Output "Creating Registry Directory complete"

Write-Output "Adding Entry to ...\Command"
New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VisualStudioCode\Command -Name "(Default)" -PropertyType String -Value C:\openVisualCode\script.exe
Write-Output "Adding Entry coomplete"
Write-Output "Installation is complete"
Write-Output "Restart explorer.exe and right click an explorer menu to check if VisualStudioCode option is ready"