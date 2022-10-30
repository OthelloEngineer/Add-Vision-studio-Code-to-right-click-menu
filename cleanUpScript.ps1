
$oldFile = Get-Item 'C:\openVisualCode' -erroraction 'silentlycontinue'
if($oldFile -ne $null){
    Write-Output "Deleting script folder recursively..."
    Remove-Item 'C:\openVisualCode' -Recurse
    Write-Output "deletion complete"
} else {
    Write-Output "No executables found"
}

$oldEntry = Get-Item -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VisualStudioCode -erroraction 'silentlycontinue'
if($oldFile -ne $null)
{
Write-Output "Removing old Entry in regex"
Remove-Item -Path Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\VisualStudioCode -Recurse
Write-Output "deletion complete"
} else {
    Write-Output "No path from previous version present"
}

$entry = Get-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open with code" -erroraction 'silentlycontinue'
if($entry -ne $null){
    Write-Output "Removing Entry in regex"
    Remove-Item -Path "Registry::HKEY_CLASSES_ROOT\Directory\Background\shell\Open with code" -Recurse
    Write-Output "deletion complete"
} else {
    Write-Output "No Entry was found"
}
