$username = [username]
$password = [password]
$path = [path]
$taskpath = [taskpath]
$csvpath = [csvpath]

$tasks = import-csv $csvpath

$tasks | foreach{
	$trigger =  New-ScheduledTaskTrigger -Daily -At $_.time
	$arguement = "-file `""+$path+$_.task+"`""
	$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument $arguement
	Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $_.task -taskpath $taskpath -user $username -password $password
}
