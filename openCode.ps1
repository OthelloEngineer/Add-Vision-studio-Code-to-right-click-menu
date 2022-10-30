Write-Output "Making Directory: C:\openVisualCode"
New-Item -Path "c:\" -Name "openVisualCode" -ItemType "directory" 
Write-Output "Making Directory: C:\openVisualCode complete"

Write-Output "Creating file script.cmd at Directory: C:\openVisualCode"
New-Item C:\openVisualCode\script.cmd
Write-Output "Creating file script.cmd at Directory: C:\openVisualCode Complete"

Write-Output "Setting content of file: C:\openVisualCode\script.cmd"
Set-Content C:\openVisualCode\script.cmd "code ."
Write-Output "Setting content complete"

Write-Output "Creating registry directory Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\testingcode"
New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open with code"
Write-Output "Creating Registry Directory complete"

Write-Output "Adding Command directory"
New-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open with code\Command"
Write-Output "Creating Registry Directory complete"

Write-Output "Adding Entry to ...\Command"
New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open with code\Command" -Name "(Default)" -PropertyType String -Value C:\openVisualCode\script.cmd
Write-Output "Adding Entry coomplete"

Write-Output "Adding icon to menu"
$icon = "vscode.ico"
$path = Get-Location
New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open with code" -Name "Icon" -PropertyType String -Value "$path\$icon"
Write-Output "Adding icon coomplete"

Write-Output "Installation is complete"

Write-Output "Restart explorer.exe and right click an explorer menu to check if VisualStudioCode option is ready"