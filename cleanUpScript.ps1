Write-Output "Deleting script folder recursively..."
Remove-Item 'C:\openVisualCode' -Recurse
Write-Output "deletion complete"

Write-Output "Removing Entry in regex"
Remove-Item -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VisualStudioCode -Recurse
Write-Output "deletion complete"

