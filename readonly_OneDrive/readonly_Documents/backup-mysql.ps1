robocopy C:\bin\DB\MySQL C:\Users\wanvi\OneDrive\Documents\Mics\mysql\mysql_backup /mir

$date = (Get-Date).tostring("yyyy_MM_dd") 

$folderName = "mysql_backup_$date"

$sourcePath = "C:\bin\DB\MySQL\"

$destinationPath = "C:\bin\mysql_backup"  

New-Item -ItemType Directory -Path $destinationPath -Name $folderName

scp -r $sourcePath "$destinationPath\$folderName"
