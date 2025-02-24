robocopy C:\xampp_8_2_12\mysql\data C:\xampp_8_2_12\mysql\backup\data /mir

robocopy C:\xampp_8_2_12\mysql\data C:\Users\wanvi\OneDrive\Documents\Mics\mysql\mysql_backup\backup /mir

$date = (Get-Date).tostring("yyyy_MM_dd") 

$folderName = "mysql_backup_$date"

$sourcePath = "C:\xampp_8_2_12\mysql"

$destinationPath = "C:\bin\mysql_backup"  

New-Item -ItemType Directory -Path $destinationPath -Name $folderName

scp -r $sourcePath "$destinationPath\$folderName"
