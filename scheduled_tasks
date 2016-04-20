$username = [username]
$password = [password]
$path = [path]
$taskpath = [taskpath]
$csvpath = [csvpath]

$tasks = import-csv $csvpath

$tasks | foreach{
	$trigger =  New-ScheduledTaskTrigger -Daily -At $_.time
	$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "-file `"$path$_.task`""
	Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $_.task -taskpath $taskpath -user $username -password $password
}
