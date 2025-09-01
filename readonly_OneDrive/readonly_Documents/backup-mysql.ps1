robocopy C:\bin\DB\MySQL C:\Users\wanvi\OneDrive\Documents\Mics\mysql\mysql_backup /mir

$date = (Get-Date).tostring("yyyy_MM_dd") 

$folderName = "mysql_backup_$date"

$sourcePath = "C:\bin\DB\MySQL\"

$destinationPath = "C:\bin\mysql_backup"  

New-Item -ItemType Directory -Path $destinationPath -Name $folderName

scp -r $sourcePath "$destinationPath\$folderName"

# --- 

$Path = "C:\bin\mysql_backup"
$Days = 3 

# Calculate cutoff date
$CutoffDate = (Get-Date).AddDays(-$Days)

# Get all subfolders older than cutoff
$OldFolders = Get-ChildItem -Path $Path -Directory | Where-Object {
    $_.LastWriteTime -lt $CutoffDate
}

# Delete them
foreach ($Folder in $OldFolders) {
    try {
        Write-Output "Deleting folder: $($Folder.FullName)"
        Remove-Item -Path $Folder.FullName -Recurse -Force
    }
    catch {
        Write-Warning "Failed to delete $($Folder.FullName): $_"
    }
}

